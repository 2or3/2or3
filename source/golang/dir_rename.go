package main

import (
    "fmt"
    "flag"
    "os"
    "io/ioutil"
    "strings"
    "unicode/utf8"
    "path/filepath"
)

var (
    replaceFromChar string
    replaceToChar string
)

func main() {
    flag.Parse()
    args := flag.Args()

    var fromDir     string
    var toDir       string

    if len(args) >= 2 {
        fromDir = args[0]
        toDir   = args[1]
    } else {
        fmt.Println("第1引数にfromのdir path, 第2引数にtoのdir pathを入力してください")
        os.Exit(0)
    }

    baseFromDir := filepath.Base(fromDir)
    baseToDir := filepath.Base(toDir)
    replaceFromChar = "_" + strings.Replace(baseFromDir, GetCommonChar(baseFromDir, baseToDir), "", 1)
    replaceToChar   = "_" + strings.Replace(baseToDir, GetCommonChar(baseFromDir, baseToDir), "", 1)

    fromDirPath, _ := filepath.Abs(fromDir)
    toDirPath, _ := filepath.Abs(toDir)
    if DirExists(toDirPath) {
        fmt.Println("toには存在しないディレクトリを指定してください")
        os.Exit(0)
    }

    err := MakeDir(toDirPath, 0755)
    if err != nil {
        fmt.Println(err)
        os.Exit(0)
    }

    err = ReadNextDir(fromDirPath, toDirPath)
    if err != nil {
        fmt.Println(err)
        os.Exit(0)
    }
}

/*
1. toのディレクトリを作成する
2. fromの中のファイルを読み込み、ループ
    1. ファイルのreplaceFromCharをreplaceToCharに置換
    2. ファイルがファイルかディレクトリか判定
    3. ファイルなら
        1. 置換後のファイル名にコピー
    4. ディレクトリなら
        1. toをに作成したディレクトリ名を付与してReadNextDirを呼び出す
*/
func ReadNextDir(fromDirPath string, toDirPath string) error {
    fromFiles, err := ioutil.ReadDir(fromDirPath)
    if err != nil {
        return err
    }

    for _, file := range fromFiles {
        fromFilePath := fromDirPath + "/" + file.Name()
        toFilePath   := toDirPath + "/" + strings.Replace(file.Name(), replaceFromChar, replaceToChar, 1)

        if file.IsDir() == true {
            err = MakeDir(toFilePath, file.Mode())
            if err != nil {
                return err
            }

            err = ReadNextDir(fromFilePath, toFilePath)
            if err != nil {
                return err
            }
        } else {
            CopyFile(fromFilePath, toFilePath, file.Mode())
        }
    }

    return nil
}

/*
指定したPathにディレクトリが存在するかどうかを確認する
1. パスをディレクトリ部分とベース部分に分割する
2. ディレクトリ部分のパスに存在するファイルを全て取得する
3. ベース部分のファイル名と2に存在するファイルを比較して、同じものがあればtrue
*/
func DirExists(dirPath string) bool {
    dir := filepath.Dir(dirPath)
    base := filepath.Base(dirPath)
    files, _ := ioutil.ReadDir(dir)

    for _, file := range files {
        if file.Name() == base {
            return true
        }
    }
    return false
}

/*
引数に指定されたPathにディレクトリを作成する
*/
func MakeDir(dirPath string, fileMode os.FileMode) error {
    err := os.Mkdir(dirPath, fileMode)
    if err != nil {
        return err
    }

    return nil
}

/*
1. 第一引数のPathに存在するファイルを読み込む
2. stringに変換し、該当のTextを置換する
3. 2で置換した結果のContentsをbyte変換し、第二引数のPathに対してファイルを作成し、書き込む
*/
func CopyFile(a string, b string, fileMode os.FileMode) error {
    contents, err := ioutil.ReadFile(a)
    if err != nil {
        return err
    }

    c := string(contents)
    c = strings.Replace(c, replaceFromChar, replaceToChar, -1)
    err = ioutil.WriteFile(b, []byte(c), fileMode)
    if err != nil {
        return err
    }

    return nil
}

/*
二つの文字列から共通する文字列を返却する（前方一致のみ）
1. 二つの文字列の長い方と短い方を決定する
2. 短い方の文字列を一文字ずつ配列にする
3. 短い文字列を一文字ずつ、長い文字列の先頭から比較して、異なる文字列が出現するまでの間の文字列を抽出する
*/
func GetCommonChar(a string, b string) string {
    longC  := a
    shortC := b
    if utf8.RuneCountInString(a) < utf8.RuneCountInString(b) {
        longC  = b
        shortC = a
    }

    replChar := ""
    toDirCharList := strings.Split(shortC, "")

    for i, c := range strings.Split(longC, "") {
        if c == toDirCharList[i] {
            replChar = replChar + c
        } else {
            break
        }
    }

    return replChar
}

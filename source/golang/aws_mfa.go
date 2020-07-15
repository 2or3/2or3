package main

import (
    "fmt"
    "os"
    "flag"

    "github.com/aws/aws-sdk-go/aws"
    "github.com/aws/aws-sdk-go/aws/session"
    "github.com/aws/aws-sdk-go/service/sts"
    "github.com/aws/aws-sdk-go/aws/credentials"
    "github.com/kelseyhightower/envconfig"
)

type Specification struct {
    Account             string
    Region              string
    IamUser             string
    CredentialsProfile  string
}

func main() {
    flag.Parse()
    args := flag.Args()

    var arn     string
    var token   string

    if len(args) >= 1 {
        token = args[0]
    } else {
        fmt.Println("第1引数にtoken codeを入力してください。")
        os.Exit(0)
    }

    if len(token) < 6 {
        fmt.Println("tokenは6桁以上で入力してください。")
        os.Exit(0)
    }

    var s Specification
    err := envconfig.Process("aws", &s)
    if err != nil {
        fmt.Println(err.Error())
    }

    sess, err := session.NewSession(&aws.Config{
        Region:         aws.String(s.Region),
        Credentials:    credentials.NewSharedCredentials("", s.CredentialsProfile),
    })

    svc := sts.New(sess)

    arn = "arn:aws:iam::" +  s.Account + ":mfa/" + s.IamUser
    params := &sts.GetSessionTokenInput{
        SerialNumber:   aws.String(arn),
        TokenCode:      aws.String(token),
    }

    req, resp := svc.GetSessionTokenRequest(params)

    err = req.Send()
    if err == nil {
        fmt.Println(resp)
    } else {
        fmt.Println(err)
    }
}


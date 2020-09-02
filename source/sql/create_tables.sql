/* UserTable */
DROP TABLE IF EXISTS bookmarks;
CREATE TABLE IF NOT EXISTS bookmarks (
 id int(11) NOT NULL auto_increment,
 url varchar(255) NOT NULL UNIQUE,
 tag varchar(255) NOT NULL,
 create_date datetime NOT NULL default '0000-00-00 00:00:00',
 update_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (id),
 KEY key_url(url)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

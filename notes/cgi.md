
# CGI

- Directory sometimes need to be 755
- .htsmaccess/.htaccess needs to contain:
```
Options +ExecCGI
AddHandler cgi-script cgi pl
```

# FCGI

- .htsmaccess/.htaccess needs to contain:
```
<IfModule mod_fcgid.c>
    AddHandler fcgid-script fcgi
    <Files ~ (\.fcgi)>
        SetHandler fcgid-script
        Options +FollowSymLinks +ExecCGI
    </Files>
</IfModule>
```



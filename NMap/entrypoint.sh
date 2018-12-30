#!/bin/sh
issues_url="https://api.github.com/repos/jgamblin/NMapActions/issues"

nmap  --script nmap-vulners,vulscan --script-args vulscandb=exploitdb.csv -sV --open -iL scan.txt --oN outputfile.txt

title="NMAP Scan on $(date "+%D %T")"
body=$(sed '1d;s/"/\\"/g;:a;N;$!ba;s/\n/\\n/g' outputfile.txt)

data="{\"title\":\"$title\",\"body\":\"$body\"}"

curl -i -H "Authorization: token $GITHUB_TOKEN" -d "$data" $issues_url

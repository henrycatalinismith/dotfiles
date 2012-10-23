
set from="henry.smith@basekit.com"
set realname="Henry Smith"
set hostname="basekit.com"

set imap_user = "henry.smith@basekit.com"

set smtp_url = "smtp://henry.smith@basekit.com@smtp.gmail.com:587/"

set from = "henry.smith@basekit.com"
set realname = "Henry Smith"

set folder = "imaps://imap.gmail.com:993"
set spoolfile = "+INBOX"
set postponed="+[Gmail]/Drafts"

mailboxes =INBOX \
          =Domains \
          =Jira \
          =Metrics \
          =Partner\ Deployments \
          =Pirate \
          =[Gmail]/All\ Mail \
          =[Gmail]/Drafts \
          =[Gmail]/Important \
          =[Gmail]/Sent\ Mail \
          =[Gmail]/Spam \
          =[Gmail]/Starred \
          =[Gmail]/Trash


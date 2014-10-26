;;;; wifi-nmcli.asd

(asdf:defsystem #:wifi-nmcli
  :serial t
  :description "Describe wifi-nmcli here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:stumpwm #:cl-ppcre)
  :components ((:file "package")
               (:file "wifi-nmcli")))


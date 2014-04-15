;;;; dropbox.asd

(asdf:defsystem #:dropbox
  :serial t
  :description "Describe dropbox here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:stumpwm)
  :components ((:file "package")
               (:file "dropbox")))


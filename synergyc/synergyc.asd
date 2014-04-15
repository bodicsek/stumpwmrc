;;;; synergyc.asd

(asdf:defsystem #:synergyc
  :serial t
  :description "Describe synergyc here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:stumpwm)
  :components ((:file "package")
               (:file "synergyc")))


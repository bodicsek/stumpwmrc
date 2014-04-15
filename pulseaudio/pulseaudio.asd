;;;; pulseaudio.asd

(asdf:defsystem #:pulseaudio
  :serial t
  :description "Describe pulseaudio here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:stumpwm)
  :components ((:file "package")
               (:file "pulseaudio")))


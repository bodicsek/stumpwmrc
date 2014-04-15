;;;; dropbox.lisp

(in-package #:dropbox)

;;; "dropbox" goes here. Hacks and glory await!

(defun fmt-dropbox (ml)
  (declare (ignore ml))
  (string-trim '(#\Space #\Tab #\Newline)
	       (stumpwm::run-prog-collect-output "/usr/bin/dropbox" "status")))

(stumpwm::add-screen-mode-line-formatter #\D #'fmt-dropbox)


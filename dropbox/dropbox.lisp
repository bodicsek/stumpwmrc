;;;; dropbox.lisp

(in-package #:dropbox)

;;; "dropbox" goes here. Hacks and glory await!

(defun fmt-dropbox (ml)
  (declare (ignore ml))
  (string-trim '(#\Space #\Tab #\Newline)
	       (run-prog-collect-output "/usr/bin/dropbox" "status")))

(add-screen-mode-line-formatter #\D #'fmt-dropbox)


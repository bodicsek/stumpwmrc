(in-package :stumpwm)

(defun fmt-dropbox (ml)
  (declare (ignore ml))
  (string-trim '(#\Space #\Tab #\Newline)
	       (run-prog-collect-output "/usr/bin/dropbox" "status")))

(add-screen-mode-line-formatter #\D #'fmt-dropbox)

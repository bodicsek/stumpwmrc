;;;; wifi-nmcli.lisp

(in-package #:wifi-nmcli)

;;; "wifi-nmcli" goes here. Hacks and glory await!

(defun fmt-ssid-wifi-nmcli (ml)
  (declare (ignore ml))
  (let ((regex-result (multiple-value-list 
		       (cl-ppcre:scan-to-strings "'(.+)':yes" 
				    (stumpwm:run-shell-command "nmcli -t -f SSID,ACTIVE dev wifi" t)))))
    (if (eq nil (first regex-result))
	"---"
	(elt (second regex-result) 0))))
    
(add-screen-mode-line-formatter #\A #'fmt-ssid-wifi-nmcli)



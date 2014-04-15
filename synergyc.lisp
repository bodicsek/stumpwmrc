(in-package :stumpwm)

(defcommand synergyc-start () ()
  "run synergy client"
  (run-shell-command "synergyc --daemon --name lenovo-linux --log ~/tmp/synergyc.log 192.168.1.9"))

(defcommand synergyc-stop () ()
  "stop synergy client"
  (run-shell-command "killall synergyc"))

(defun fmt-synergyc (ml)
  (declare (ignore ml))
  (elt (first 
	(rest 
	 (multiple-value-list 
	  (cl-ppcre:scan-to-strings "[NOTE:|WARNING:|FATAL]: (.+)" 
				    (run-shell-command "tail -n 2 ~/tmp/synergyc.log" t)))))
       0))
    
	
(add-screen-mode-line-formatter #\S #'fmt-synergyc)

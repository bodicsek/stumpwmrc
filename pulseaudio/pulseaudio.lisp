;;;; pulseaudio.lisp

(in-package #:pulseaudio)

;;; "pulseaudio" goes here. Hacks and glory await!

(defun volume-get-mute ()
  (string-trim '(#\Space #\Tab #\Newline)
	       (run-shell-command
		"pactl list sinks | grep 'Mute:'| sed -r 's/.+Mute: (yes|no)/\\1/'"
		t)))

(defcommand volume-mute () ()
  "toggle volume mute state"
  (if (string= "yes" (volume-get-mute))
      (run-shell-command "pactl set-sink-mute 0 0")
      (run-shell-command "pactl set-sink-mute 0 1")))

(defcommand volume-raise () ()
  "raise the volume with 5%"
  ;;0x10000 x (curr+5) / 100 = X
  (volume-run-command #'(lambda (x y) (+ x y))))

(defcommand volume-lower () ()
  "lower the volume with 5%"
  ;;0x10000 x (curr-5) / 100 = X
  (volume-run-command #'(lambda (x y) (- x y))))

(defun volume-get-percent ()
  (string-trim '(#\Space #\Tab #\Newline) 
	       (run-shell-command 
		"pactl list sinks | grep 'Volume: 0:'| sed -r 's/.+Volume: 0:\\s*([0-9]+)%.+/\\1/'" 
		t)))

(defun volume-run-command (modifier)
  (let ((next-vol-value (max 0 (round (/ (* #x10000 (funcall modifier (parse-integer (volume-get-percent)) 5)) 100)))))
    (run-shell-command
     (concat "pactl set-sink-volume 0 0x" (write-to-string next-vol-value :base 16)))))


(defun fmt-volume (ml)
  (declare (ignore ml))
  (let ((percent (volume-get-percent))
	(mute (volume-get-mute)))
    (if (string= "yes" mute)
	"---"
	percent)))
	
(add-screen-mode-line-formatter #\V #'fmt-volume)


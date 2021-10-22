;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:

(defun generate-name ()
  (format "%c%c%03d"
          (+ ?A (random (- ?Z ?A)))
          (+ ?A (random (- ?Z ?A)))
          (random 1000)))

(defun build-robot ()
  (list :name (generate-name)))

(defun reset-robot (robot)
  (setf (getf robot :name) (generate-name)))

(defun robot-name (robot)
  (getf robot :name))

(provide 'robot-name)
;;; robot-name.el ends here
;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:

(defun from (&rest spec)
  (let* ((reference-date (apply #'encode-time (append spec '("UTC0"))))
	 (gigasecond (time-add reference-date (expt 10 9))))
    (subseq (decode-time gigasecond "UTC0") 0 6)))

(provide 'gigasecond)
;;; gigasecond.el ends here
(in-package #:cl-user)
(ql:quickload :local-time)

(defpackage #:meetup
  (:use #:common-lisp)
  (:import-from #:local-time
		#:encode-timestamp
		#:decode-timestamp
		#:adjust-timestamp
		#:offset
		#:days-in-month
		#:timestamp-day-of-week
		)
  (:export #:meetup))

(in-package #:meetup)


(defun ordinal-keywords (&optional (from 1) (to 5))
  "Using FORMAT magic and interning in the :KEYWORD package, generate
   list of ordinals from FROM to TO."
  (loop
     for i from from to to
     collect (intern (format nil "~:@(~:r~)" i) :keyword)))

(defun ordinal-to-number (ordinal)
  "Convert keyword ORDINAL to corresponding number. Do not try more
   than 5 times. If not found return NIL."
  (loop
     for i from 1 to 5
     for ord = (intern (format nil "~:@(~:r~)" i) :keyword)
     when (eql ord ordinal)
     do (return i)))

(defun dow-to-number (dow)
  (case dow
    (:monday 1)
    (:tuesday 2)
    (:wednesday 3)
    (:thursday 4)
    (:friday 5)
    (:saturday 6)
    (:sunday 0)))

(defun timestamp-to-date (timestamp)
  (reverse
   (subseq
    (multiple-value-list
     (decode-timestamp timestamp)) 4 7)))

(defun meetup (month year dow descriptor)
  (macrolet ((case-handling (day month year result)
	       `(let* ((n-th (encode-timestamp 0 0 0 0 ,day ,month ,year))
		       (n-th-dow (timestamp-day-of-week n-th))
		       (dow-n (dow-to-number dow))
		       (result ,result))
		  (timestamp-to-date result))))
   (case descriptor
     (:teenth
      (case-handling 13 month year
		     (if (= dow-n n-th-dow)
			 n-th
			 (adjust-timestamp n-th
			   (offset :day (mod (- dow-n n-th-dow) 7))))))
     (:last
      (case-handling (days-in-month month year) month year
		     (if (= dow-n n-th-dow)
			 n-th
			 (adjust-timestamp n-th
			   (offset :day (mod (- dow-n n-th-dow) -7))))))
     (#.(ordinal-keywords)
	(case-handling 1 month year
		       (adjust-timestamp
			   (if (= dow-n n-th-dow)
			       n-th
			       (adjust-timestamp n-th
				 (offset :day (mod (- dow-n n-th-dow) 7))))
			 (offset :day (* 7 (1- (ordinal-to-number descriptor))))))))))
;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

;; * eggs (1)
;; * peanuts (2)
;; * shellfish (4)
;; * strawberries (8)
;; * tomatoes (16)
;; * chocolate (32)
;; * pollen (64)
;; * cats (128)

(defvar *allergens*
  '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats"))

(defun allergen-list (n)
  (labels ((process (n al agg)
		    (if (or (zerop n)
			    (null al))
			(nreverse agg)
		      (process (/ n 2)
			       (cdr al)
			       (if (zerop (mod n 2))
				   agg (cons (car al) agg))))))
    (process n *allergens* nil)))

(defun allergic-to-p (n allergen)
  (let* ((allergen-index (position allergen *allergens* :test #'string=))
	 (bit (ash 1 allergen-index)))
    (not (zerop (logand n bit)))))

(provide 'allergies)
;;; allergies.el ends here
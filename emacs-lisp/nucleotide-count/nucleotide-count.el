;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:

;;; Code:

(defun nucleotide-count (dna)
  (if (let ((case-fold-search nil))
        (string-match "[^ACGT]" dna))
      (error "invalid sequence")
    (loop
     with freq = (list (cons ?A 0)
                       (cons ?C 0)
                       (cons ?G 0)
                       (cons ?T 0))
     for c across dna
     do (incf (cdr (assoc c freq)))
     finally (return freq))))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
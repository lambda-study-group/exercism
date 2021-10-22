;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun hash-equal (hash1 hash2)
  "Compare two hash tables to see whether they are equal."
  (and (= (hash-table-count hash1)
          (hash-table-count hash2))
       (catch 'flag (maphash (lambda (x y)
                               (or (equal (gethash x hash2) y)
                                   (throw 'flag nil)))
                             hash1)
              (throw 'flag t))))

(defun histogram (string)
  (loop
   with hash = (make-hash-table)
   for c across string
   do (incf (gethash c hash 0))
   finally (return hash)))

(defun anagram? (s1 s2)
  (let ((s1 (downcase s1))
	(s2 (downcase s2)))
    (unless (string= s1 s2)
      (hash-equal (histogram s1) (histogram s2)))))

(defun anagrams-for (word words)
  (remove-if-not (lambda (w) (anagram? w word)) words))

(provide 'anagram)
;;; anagram.el ends here
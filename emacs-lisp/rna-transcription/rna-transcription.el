;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:



;;; Code:

(defvar *transcription-key*
  #s(hash-table data (?G ?C ?C ?G ?T ?A ?A ?U)))

(defun to-rna (dna)
  (if (set-difference (delete-dups (string-to-list dna))
                      (list ?G ?C ?T ?A))
      (error "incorrect sequence")
      (concat (mapcar (lambda (x)
                        (gethash x *transcription-key*))
                      dna))))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
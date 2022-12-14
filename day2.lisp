(in-package #:advent2022)

(defun read-strategy () 
  (loop :for g :in  (uiop:read-file-lines (asdf:system-relative-pathname 'advent2022 "inputs/day2"))
	:collect  (mapcar 'read-from-string (split "\\s+" g))  )  )

(defun give-point-tool (tool)
	(cond
	  ( (eql tool 'A) 1)
	  ( (eql tool 'B) 2)
	  ( (eql tool 'C) 3)
	  ( (eql tool 'X) 1)
	  ( (eql tool 'Y) 2)
	  ( (eql tool 'Z) 3)
	  ) )
(defun win-lose  (L)
  (let ((H (first L)) (M (second L)))
    (cond
      ( (and (eql H 'A) (eql M 'X)) 3)
      ( (and (eql H 'A) (eql M 'Y)) 6)
      ( (and (eql H 'A) (eql M 'Z)) 0)
      ( (and (eql H 'B) (eql M 'X)) 0)
      ( (and (eql H 'B) (eql M 'Y)) 3)
      ( (and (eql H 'B) (eql M 'Z)) 6)
      ( (and (eql H 'C) (eql M 'X)) 6)
      ( (and (eql H 'C) (eql M 'Y)) 0)
      ( (and (eql H 'C) (eql M 'Z)) 3)
      ))
  )


(defun second-strategy  (L)
  (let ((H (first L)) (M (second L)))
    (cond
      ( (and (eql H 'A) (eql M 'X)) (apply '+ (list 3 0)))
      ( (and (eql H 'A) (eql M 'Y)) (apply '+ (list 1 3)))
      ( (and (eql H 'A) (eql M 'Z)) (apply '+ (list 2 6)))
      ( (and (eql H 'B) (eql M 'X)) (apply '+ (list 1 0)))
      ( (and (eql H 'B) (eql M 'Y)) (apply '+ (list 2 3)))
      ( (and (eql H 'B) (eql M 'Z)) (apply '+ (list 3 6)))
      ( (and (eql H 'C) (eql M 'X)) (apply '+ (list 2 0)))
      ( (and (eql H 'C) (eql M 'Y)) (apply '+ (list 3 3)))
      ( (and (eql H 'C) (eql M 'Z)) (apply '+ (list 1 6)))
      ))
  )

(defun day2/solution1 ()
  (loop for game in (read-strategy)
	sum (+ (win-lose game) (give-point-tool (second game))))
  )


(defun day2/solution2 ()
  (loop for game in (read-strategy)
        sum (second-strategy game) ))

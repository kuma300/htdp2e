;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rocketGreen) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; constants
(define HEIGHT 100)
(define WIDTH  100)
(define CENTER (/ WIDTH  2))
(define ROCK-HEIGHT 10)
(define ROCK   (rectangle 40 ROCK-HEIGHT "solid" "brown"))
(define ROCKET (overlay (circle 10 "solid" "green")         
                        (rectangle 40 4 "solid" "green")))
(define MTSCN  (place-image ROCK
                            50 95
                            (empty-scene WIDTH HEIGHT "blue")))

(define ROCKET-CENTER-TO-BOTTOM  
  (- HEIGHT (+ ROCK-HEIGHT (/ (image-height ROCKET) 2))))

; functions
  
(define (create-rocket-scene h) 
  (cond    [(<= h ROCKET-CENTER-TO-BOTTOM)
            (place-image ROCKET CENTER h MTSCN)]   
           [(> h ROCKET-CENTER-TO-BOTTOM)  
            (place-image ROCKET CENTER ROCKET-CENTER-TO-BOTTOM MTSCN)]))

(animate create-rocket-scene)

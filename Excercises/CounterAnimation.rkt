;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname counter-animation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Simple Counter
;; displays a counter on the screen, beginning with 0

;; =================
;; Constants:

(define WIDTH 100)
(define HEIGHT 100)
(define MTS (empty-scene WIDTH HEIGHT))

(define CTR-X (/ WIDTH  2)) ; position on x-axis
(define CTR-Y (/ HEIGHT 2)) ; position on y-axis

(define TXT-SIZE 24)        ; counter text size
(define TXT-COL "black")    ; counter text color


;; =================
;; Data definitions:

;; Counter is Natural
;; interp. shows a number

(define C1 0)
(define C2 230)

#;
(define (fn-for-counter c)
  (... c))

;; Template rules used:
;;  - atomic non-distinct: Natural


;; =================
;; Functions:

;; Counter -> Counter
;; start the world with (main 0)
;; 
(define (main c)
  (big-bang c                       ; Counter
            (to-draw   render)      ; Counter -> Image
            (on-key    handle-ke))) ; Counter KeyEvent -> Counter

;; Counter -> Image
;; render the current count on the screen
(check-expect (render 0) (place-image (text (number->string 0) TXT-SIZE TXT-COL) CTR-X CTR-Y MTS))

; (define (render c) MTS) ; stub

;; Template from Counter
(define (render c)
  (place-image (text (number->string c) TXT-SIZE TXT-COL)
               CTR-X
               CTR-Y
               MTS))


;; Counter KeyEvent -> Counter
;;   pressing Arrow-Up increases the counter by 1
;;   pressing Arrow-Down decreases the counter by 1 until it reaches 0
;;   pressing space resets the counter

(check-expect (handle-ke 5 "up")   6)
(check-expect (handle-ke 5 "down") 4)
(check-expect (handle-ke 5 "a")    5) 
(check-expect (handle-ke 0 "down") 0)
(check-expect (handle-ke 4 " ")    0)

; (define (handle-ke c ke) 0) ; stub

;; Template from KeyEvent
(define (handle-ke c ke)
  (cond [(key=? ke "up") (+ c 1)]
        [(and (key=? ke "down") (> c 0)) (- c 1)]
        [(key=? ke " ") 0]
        [else c]))

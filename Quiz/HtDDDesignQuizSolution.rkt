;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDD_Design_Quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
(... a))
;; Template rules used:
;; - atomic non-distinct: Natural

; Problem 1:
; 
; Consider the above data definition for the age of a person.
; 
; Design a function called teenager? that determines whether a person
; of a particular age is a teenager (i.e., between the ages of 13 and 19).

;; Age -> Boolean
;; produces true if a person is within the age range of a teenager (13 and 19 (inclusive))
(check-expect (teenager? 11) false)
(check-expect (teenager? 13) true)
(check-expect (teenager? 15) true)
(check-expect (teenager? 19) true)
(check-expect (teenager? 20) false)

;(define (teenager? a) true) ; stub

;<template used from Age>
(define (teenager? a)
(and (<= 13 a)
(>= 19 a)))

; Problem 2:
; 
; Design a data definition called MonthAge to represent a person's age
; in months.

;; MonthAge is Natural
;; interp. the age of a person in months
(define MA0 18)
(define MA1 25)

#;
(define (fn-for-months-age ma)
(... ma))
;; Template rules used:
;; - atomic non-distinct: Natural

; Problem 3:
; 
; Design a function called months-old that takes a person's age in years 
; and yields that person's age in months.
;

;; Age -> MonthAge
;; takes a person's age in years and produces the age in months
(check-expect (months-old 1) 12)
(check-expect (months-old 55) (* 55 12))

;(define (months-old ma) 12) ; stub

;<template used from MonthAge>
(define (months-old ma)
(* ma 12))

; Problem 4:
; 
; Consider a video game where you need to represent the health of your
; character. The only thing that matters about their health is:
; 
; - if they are dead (which is shockingly poor health)
; - if they are alive then they can have 0 or more extra lives
; 
; Design a data definition called Health to represent the health of your
; character.
; 
; Design a function called increase-health that allows you to increase the
; lives of a character. The function should only increase the lives
; of the character if the character is not dead, otherwise the character
; remains dead.

;; Health is one of:
;; - false
;; - Natural Number (including 0)
;; interp. false means a dead character, number shows how many extra lives the character has

(define HDead false) ; dead
(define H0 0) ; no extra lives
(define H5 5) ; 5 exta lives

#;
(define (fn-for-health h)
(cond [(false? h) (...)]
[else (... h)]))
;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: false
;; - atomic non-distinct: Number

;; Health Natural -> Health
;; increases the lives of a living character
(check-expect (increase-health false 3) false)
(check-expect (increase-health 0 3) 3)
(check-expect (increase-health 4 1) 5)

;(define (increase-health h n) 1) ; stub

;<template used from Health>
(define (increase-health h n)
(cond [(false? h) false]
[else (+ h n)]))
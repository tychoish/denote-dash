;;; test-denote-dash-savehist.el --- Denote history tests -*- lexical-binding: t; -*-
;;; Commentary:
;; Tests for global mode history registration.
;;; Code:
(require 'ert)
(require 'denote-dash)

(ert-deftest denote-dash/global-mode-registers-denote-history ()
  (let ((savehist-additional-variables nil))
    (unwind-protect
        (progn (denote-dash-global-mode 1)
               (should (memq 'denote--title-history savehist-additional-variables))
               (should (memq 'denote--keywords-history savehist-additional-variables)))
      (denote-dash-global-mode -1))))

(ert-deftest denote-dash/subtree-extraction-uses-denote-convert ()
  (denote-dash--setup-transients)
  (should (eq (plist-get (cdr (transient-get-suffix 'denote-dash-dispatch "or")) :command)
              'denote-convert-subtree)))

(provide 'test-denote-dash-savehist)
;;; test-denote-dash-savehist.el ends here

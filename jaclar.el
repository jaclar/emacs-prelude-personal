;; setting my personal modes dir
(defvar prelude-personal-modes-dir
  (concat prelude-personal-dir "modes/"))
(let ((default-directory prelude-personal-modes-dir))
  (normal-top-level-add-subdirs-to-load-path))

;; setting personal yasnippet dir
(defvar prelude-personal-snippet-dir
  (concat prelude-personal-dir "snippets/"))
(yas/load-directory prelude-personal-snippet-dir)

;; theming
;; (load-theme 'solarized-dark t)
;; make UTF-8 coding default
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; Use hunspell instead of ispell
;; (setq ispell-program-name "hunspell")
;; (eval-after-load "ispell"
;;   '(progn (defun ispell-get-coding-system () 'utf-8)))
;; (require 'rw-language-and-country-codes)
;; (require 'rw-ispell)
;; (require 'rw-hunspell)
;; (setq ispell-dictionary "en_US_hunspell")
;; (setq rw-hunspell-default-dictionary "en_US_hunspell")
;; (setq rw-hunspell-dicpath-list (quote ("/usr/share/hunspell")))
;; (setq rw-hunspell-use-rw-ispell t)

;; deactivate middle mouse pasting
(global-set-key [mouse-2] 'nil)

;; Yank history to ctrl-c y
(global-set-key "\C-cy" '(lambda ()
    (interactive) (popup-menu 'yank-menu)))

;; ;; AUCTex configuration
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)

;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)


;; helm
(global-set-key (kbd "C-x h") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

; pkgbuild-mode
(require 'pkgbuild-mode)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))
                              auto-mode-alist))

;; linum-mode
(global-linum-mode t)

;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; cc-mode tabs
(setq-default c-basic-offset 4
              tab-width 4)

;; whitespace-mode
; ugly hack to get constantly rid of long line indicator
(setq whitespace-line-column 250)

;; hippie-expand
(add-to-list 'hippie-expand-try-functions-list 'yas/hippie-try-expand)

;; js2-mode config
(add-hook 'js2-mode-hook 'whitespace-mode)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-<") 'mc/mark-all-like-this)

;; load-path
;; 参考 http://blog.fusic.co.jp/archives/94
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/elisp/"))
       load-path))

;; 文字コード等基本設定
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; xterm-mouse-mode
;; コンソールでもマウス操作させる
;; 参考 http://d.hatena.ne.jp/sabottenda/20120602/1338643214
(unless (fboundp 'track-mouse)
  (defun track-mouse (e)))
(xterm-mouse-mode t)
(require 'mouse)
(require 'mwheel)
(mouse-wheel-mode t)

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/") ;Emacs Lispをインストールするディレクトリの指定
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup) ;install-elisp.elとコマンド名を同期

;; anything
(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)

;; php-mode
(require 'php-mode)

(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する

;; php-mode-hook
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))

;====================================
;;全角スペースとかに色を付ける
;====================================
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-b-1 '((t (:background "dark turquoise"))) nil)
(defface my-face-b-2 '((t (:background "cyan"))) nil)
(defface my-face-b-2 '((t (:background "SeaGreen"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
            (font-lock-add-keywords
                 major-mode
                    '(
                           ("　" 0 my-face-b-1 append)
                           ("\t" 0 my-face-b-2 append)
                           ("[ ]+$" 0 my-face-u-1 append)
          )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                             (if font-lock-mode
                               nil
                               (font-lock-mode t))))

;; 行番号表示 M-x wb-line-number-toggle で切り替え
;; 参考 http://homepage1.nifty.com/blankspace/emacs/wb-line-number.html
;; (require 'wb-line-number)
;; (wb-line-number-toggle)

;; 下のバーに行と列を表示
(column-number-mode t)
(line-number-mode t)

;; タブ幅設定
(setq-default tab-width 4)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; 以降Emacs実践入門のに関する設定
;; 参考 http://www.clear-code.com/blog/2012/3/20.html

;; Localeに合わせた環境の設定
(set-locale-environment nil)

;; C-hでバックスペース
(keyboard-translate ?\C-h ?\C-?)

;; 基本操作設定
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c g") 'grep)               ; grep


;; ウィンドウ移動
;; 次のウィンドウへ移動
(define-key global-map (kbd "C-M-n") 'next-multiframe-window)
;; 前のウィンドウへ移動
(define-key global-map (kbd "C-M-p") 'previous-multiframe-window)

;; 再帰的にgrep
(require 'grep)
(setq grep-command-before-query "grep -nH -r -e ")
(defun grep-default-command ()
  (if current-prefix-arg
      (let ((grep-command-before-target
             (concat grep-command-before-query
                     (shell-quote-argument (grep-tag-default)))))
        (cons (if buffer-file-name
                  (concat grep-command-before-target
                          " *."
                          (file-name-extension buffer-file-name))
                (concat grep-command-before-target " ."))
              (+ (length grep-command-before-target) 1)))
    (car grep-command)))
(setq grep-command (cons (concat grep-command-before-query " .")
                         (+ (length grep-command-before-query) 1)))

;;; 対応する括弧を光らせる。
(show-paren-mode 1)

;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 補完可能なものを随時表示
;;; 少しうるさい
(icomplete-mode 1)

;; 履歴数を大きくする
(setq history-length 10000)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

;; 関数名表示
(which-function-mode 1)

;; diredから適切なバージョン管理システムの*-statusを起動
(defun dired-vc-status (&rest args)
  (interactive)
  (let ((path (find-path-in-parents (dired-current-directory)
                                    '(".svn" ".git"))))
    (cond ((null path)
           (message "not version controlled."))
          ((string-match-p "\\.svn$" path)
           (svn-status (file-name-directory path)))
          ((string-match-p "\\.git$" path)
           (magit-status (file-name-directory path))))))
(define-key dired-mode-map "V" 'dired-vc-status)

;; directoryの中にbase-names内のパスが含まれていたらその絶対パスを返す。
;; 含まれていなかったらdirectoryの親のディレクトリを再帰的に探す。
(defun find-path-in-parents (directory base-names)
  (or (find-if 'file-exists-p
               (mapcar (lambda (base-name)
                         (concat directory base-name))
                       base-names))
      (if (string= directory "/")
          nil
        (let ((parent-directory (substring directory 0 -1)))
          (find-path-in-parents parent-directory base-names)))))

;; 自動スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")



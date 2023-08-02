;;; packages.el --- lean4 layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author:  <pvk@thestallion>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `lean4-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `lean4/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `lean4/pre-init-PACKAGE' and/or
;;   `lean4/post-init-PACKAGE' to customize the package as it is loaded.

;; TODO autocomplete??

;;; Code:

(defconst lean4-packages
  '((lean4-mode :location (recipe
                           :fetcher github
                           :repo "leanprover/lean4"
                           :files ("lean4-mode/*.el")))
    smartparens
    )
  )

(defun lean4/init-lean4-mode ()
  (use-package lean4-mode
    :defer t
    :mode "\\.lean\\'"
    )
  (add-to-list 'spacemacs-indent-sensitive-modes 'lean4-mode)
  )

(defun lean4/post-init-lean4-mode ()
  (spacemacs/set-leader-keys-for-major-mode 'lean4-mode
    "k" 'quail-show-key
    "c" 'lean4-std-exe
    "i" 'lean4-toggle-info
    "d" 'lean4-refresh-file-dependencies
    "l" 'lean4-lake-build
    "en" 'flycheck-next-error
    "ep" 'flycheck-previous-error
    "el" 'flycheck-list-errors
    )
  )

(defun lean4/pre-init-smartparens ()
  (spacemacs|use-package-add-hook smartparens
    :post-config
    (progn
      (sp-local-pair 'lean4-mode "/-" "-/")
      (sp-local-pair 'lean4-mode "`'" nil :actions :rem)
      (sp-local-pair 'lean4-mode "⟨" "⟩")
      (sp-local-pair 'lean4-mode "«" "»"))))

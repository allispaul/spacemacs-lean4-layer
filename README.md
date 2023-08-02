
* Description
This layer adds support for the [Lean 4 theorem prover](https://github.com/leanprover),
using [lean-mode](https://github.com/leanprover/lean-mode). Thanks to the maintainers
of lean-mode, and to robkorn for the [Lean 3 layer](https://github.com/robkorn/spacemacs-lean-layer/tree/master).

* Install
You need to [install Lean 4](https://leanprover.github.io/lean4/doc/setup.html#basic-setup)
to use this layer.

To install:
1. `git clone https://github.com/allispaul/spacemacs-lean4-layer.git ~/.emacs.d/private/lean4`
2. Add `lean4` to `dotspacemacs-configuration-layers` in your `~/.spacemacs`.

* Key bindings

| Key Binding | Description                                  |
|-------------+----------------------------------------------|
| ~SPC m c~ | Execute lean in standalone mode (`lean4-std-exe`) |
| ~SPC m d~ | Recompile & reload imports (`lean4-refresh-file-dependencies`) |
| ~SPC m i~ | Toggle info buffer showing goals and errors at point (`lean4-toggle-info`) |
| ~SPC m k~ | Describe keys needed to type symbol at point (`quail-show-key`) |
| ~SPC m l~ | Build package with lake (`lean4-lake-build`) |
| ~SPC m g d~ | Jump to definition (`xref-find-definitions`) |
| ~SPC m g b~ | Jump back (`xref-pop-marker-stack`)          |
| ~SPC m e n~ | flycheck: go to next error |
| ~SPC m e p~ | flycheck: go to previous error |
| ~SPC m e l~ | flycheck: list errors |


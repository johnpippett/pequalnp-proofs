import Mathlib
import PEqualNP.Defs

open Finset

/-- Child h1 of R_meta_4480_1: removing the unique wire-incident pair strictly drops the card. -/
theorem card_dec (x1 x2 : ℕ) (x3 : Finset (Fin x1 × Fin x2)) (i0 : Fin (x1 + x2))
    (x11 : Finset (Fin x1 × Fin x2))
    (hx11 : x11 = {x9 ∈ x3 | ¬(Fin.castAdd x2 x9.1 = i0 ∨ Fin.natAdd x1 x9.2 = i0)})
    (hcard : (Finset.filter (fun x9 : Fin x1 × Fin x2 =>
        Fin.castAdd x2 x9.1 = i0 ∨ Fin.natAdd x1 x9.2 = i0) x3).card = 1) :
    x11.card < x3.card := by
  classical
  have hsplit := Finset.card_filter_add_card_filter_not (s := x3)
    (p := fun x9 : Fin x1 × Fin x2 => Fin.castAdd x2 x9.1 = i0 ∨ Fin.natAdd x1 x9.2 = i0)
  rw [hcard] at hsplit
  have h11eq : x11.card = (x3.filter (fun a : Fin x1 × Fin x2 =>
      ¬(Fin.castAdd x2 a.1 = i0 ∨ Fin.natAdd x1 a.2 = i0))).card := by rw [hx11]
  rw [h11eq]
  omega

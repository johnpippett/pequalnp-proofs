import Mathlib
import PEqualNP.Defs

namespace PEqualNP.MetaComplexity

open PEqualNP.CircuitLowerBounds

def starCircuit : Circuit where
  gates := [
    ⟨GateOp.or, [1, 2]⟩,
    ⟨GateOp.or, [8, 3]⟩,
    ⟨GateOp.or, [9, 4]⟩,
    ⟨GateOp.or, [10, 5]⟩,
    ⟨GateOp.or, [11, 6]⟩,
    ⟨GateOp.or, [12, 7]⟩,
    ⟨GateOp.and, [0, 13]⟩]
  output := 14

end PEqualNP.MetaComplexity

set_option maxRecDepth 1000000 in
theorem PEqualNP.Outside.L_meta_1166 : ∃ C : PEqualNP.CircuitLowerBounds.Circuit, PEqualNP.MetaComplexity.Monotone2 C ∧ C.size ≤ 7 ∧ ∀ x : Fin 8 → Bool, C.eval (List.ofFn x) = (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 0 && x 6) || (x 0 && x 7)) x := by
  refine ⟨PEqualNP.MetaComplexity.starCircuit, ?_, ?_, ?_⟩
  · intro g hg
    simp [PEqualNP.MetaComplexity.starCircuit] at hg
    rcases hg with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> simp
  · decide
  · decide

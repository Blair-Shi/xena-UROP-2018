import tactic.ring 
import data.nat.prime
import data.nat.modeq data.int.modeq
import analysis.real
import tactic.norm_num
import algebra.group_power
import M3P14.order
import data.nat.prime
import chris_hughes_various.zmod
import M3P14.sheet1
import tactic.ring

open nat 

definition quadratic_res (a n : ℤ) := ∃ x: ℕ, a ≡ x^2 [ZMOD n]

attribute [instance, priority 0] classical.prop_decidable
noncomputable definition legendre_sym {p : ℕ} (a : ℤ) (H1 : prime p ∧ p ≠ 2) : ℤ := 
if quadratic_res a p ∧ ¬ ((p : ℤ) ∣ a) then 1 else 
if ¬ quadratic_res a p then -1 
else 0

theorem law_of_quadratic_reciprocity {p q : ℕ} (hp : prime p ∧ p ≠ 2) (hq : prime q ∧ q ≠ 2) : (legendre_sym p hq)*(legendre_sym q hp) = (-1)^(((p-1)/2)*((q-1)/2)) := sorry 

theorem legendre_sym_mul {p : ℕ} (a b : ℕ) (hp : prime p ∧ p ≠ 2) : legendre_sym (a*b) hp = (legendre_sym a hp)*(legendre_sym b hp) := sorry

theorem legendre_sym_refl {p : ℕ} (a b : ℕ) (hp : prime p ∧ p ≠ 2) :  (a ≡ b [MOD p] → legendre_sym a hp = legendre_sym b hp) :=sorry

theorem legendre_sym_supplementary_laws {p : ℕ} (hp : prime p ∧ p ≠ 2) : legendre_sym 2 hp = (-1:ℤ)^((p^2-1)/8) := sorry 

lemma pow_two_eq_mul_self (x : ℕ) : x^2 = x * x := begin show 1*x*x=x*x,rw one_mul end

lemma factorization_x_square_minus_one(x:ℕ) : x^2-1 = (x+1)*(x-1):= begin
rw pow_two_eq_mul_self,
cases x with t,
norm_num,
show (t+1) * (t+1) - 1 = (succ t + 1) * t,
ring,
end

lemma euler_c_1 (a p : ℕ) (hp : prime p ∧ p ≠ 2) (ha : ¬ p ∣ a) : quadratic_res a p → a^((p-1)/2)-1 ≡ 0 [ZMOD p] := 
begin
intro Hqr,
cases Hqr with x hx,





end


theorem euler_criterion (p : ℕ) (a : ℕ) (hp : prime p ∧ p ≠ 2) (ha : ¬ p ∣ a) :
  (a^((p - 1) / 2) : ℤ) ≡ legendre_sym a hp [ZMOD p] := 
begin 
  have h1 : a^(p-1) ≡ 1 [MOD p], from fermat_little_theorem_extension a p hp.left,
  have h2 : ↑(a ^ (p - 1)) ≡ ↑1 [ZMOD ↑p], from (int.modeq.coe_nat_modeq_iff (a^(p-1)) 1 p).mpr h1,
  have h3 : ↑1 ≡ ↑1 [ZMOD p], from int.modeq.refl 1,
  have h4 : ((a ^ (p - 1)) : ℕ) - 1 ≡ 0 [ZMOD p], from int.modeq.modeq_sub h2 h3,
  have h5 : (a ^ ((p - 1)/2))^2-1 = (a^((p-1)/2)+1)*(a^((p-1)/2)-1), from factorization_x_square_minus_one (a^((p-1)/2)),


  
  sorry,
end



--Let p be an odd prime. Then there are exactly (p - 1) /2 quadratic residues modulo p and exactly (p - 1) /2 nonresidues modulo p. 
--theorem quad_res_sol {p : ℕ} (hp : prime p) : 

theorem minus_one_quad_res_of_p {p : ℕ} (hp : prime p ∧ p ≠ 2) : (p ≡ 1 [MOD 4] ↔ legendre_sym (-1 : ℤ) hp = 1) ∧ (p ≡ 3 [MOD 4] ↔ legendre_sym (-1 : ℤ) hp = (-1 : ℤ)) := sorry

lemma quad_res_two (n : ℕ) : n % 8 = 1 ∨ n % 8 = 7 → ((n ^ 2 - 1) / 8 % 2 = 0) :=
begin
  intro H,
  have H2 := nat.mod_add_div n 8,
  cases H,
  { rw H at H2,
    rw ←H2,
    rw ←nat.dvd_iff_mod_eq_zero,
    suffices : ∀ t, 2 ∣ ((1 + 8 * t) ^ 2 - 1) / 8,
      exact this (n/8),
    intro t,
    existsi t+4*t*t,
    show (1 * (1 + 8 * t) * (1 + 8 * t) - 1) / 8 = 2 * (t + 4 * t * t),
    rw (show 1 * (1 + 8 * t) * (1 + 8 * t) = 8 * (2 * t + 8 * t * t) + 1, by ring),
    rw nat.add_sub_cancel,
    rw nat.mul_div_cancel_left _ (show 8 > 0, from dec_trivial),
    ring
  },
  { rw H at H2,
    rw ←H2,
    rw ←nat.dvd_iff_mod_eq_zero,
    suffices : ∀ t, 2 ∣ ((7 + 8 * t) ^ 2 - 1) / 8,
      exact this (n/8),
    intro t,
    existsi 3+7*t+4*t*t,
    show (1 * (7 + 8 * t) * (7 + 8 * t) - 1) / 8 = 2 * (3 + 7 * t + 4 * t * t),
    rw (show 1 * (7 + 8 * t) * (7 + 8 * t) = 8 * (6 + 14 * t + 8 * t * t) + 1, by ring),
    rw nat.add_sub_cancel,
    rw nat.mul_div_cancel_left _ (show 8 > 0, from dec_trivial),
    ring
  }
end 

lemma quad_nonres_two (n : ℕ) : n % 8 = 3 ∨ n % 8 = 5 → ((n ^ 2 - 1) / 8 % 2 = 1) :=
begin
  intro H,
  have H2 := nat.mod_add_div n 8,
  cases H,
  { rw H at H2,
    rw ←H2,
    suffices : ∀ t : ℕ, ((3 + 8 * t) ^ 2 - 1) / 8 % 2 = 1,
      exact this (n/8),
    intro t,
    have H3 : (1 + 2 * (4*t^2 + 3*t)) % 2 = 1,
      rw nat.add_mul_mod_self_left,exact dec_trivial,
    suffices : ((3 + 8 * t) ^ 2 - 1) / 8 = (1 + 2 * (4 * t ^ 2 + 3 * t)),
      rwa this,
    suffices : ((3 + 8 * t) ^ 2 - 1) = 8 * (1 + 2 * (4 * t ^ 2 + 3 * t)),
      rw this,
    rw nat.mul_div_cancel_left _ (show 8 > 0, from dec_trivial),
    ring
  },
  { rw H at H2,
    rw ←H2,
    suffices : ∀ t : ℕ, ((5 + 8 * t) ^ 2 - 1) / 8 % 2 = 1,
      exact this (n/8),
    intro t,
    have H3 : (1 + 2 * (4*t^2 + 5*t + 1)) % 2 = 1,
      rw nat.add_mul_mod_self_left,exact dec_trivial,
    suffices : ((5 + 8 * t) ^ 2 - 1) / 8 = (1 + 2 * (4 * t ^ 2 + 5 * t + 1)),
      rwa this,
    suffices : ((5 + 8 * t) ^ 2 - 1) = 8 * (1 + 2 * (4 * t ^ 2 + 5 * t + 1)),
      rw this,
    rw nat.mul_div_cancel_left _ (show 8 > 0, from dec_trivial),
    ring
  }
end 
import Euclid.tarski_5
open classical set
namespace Euclidean_plane
variables {point : Type} [Euclidean_plane point]

local attribute [instance] prop_decidable

theorem eleven22a {a b c p a' b' c' p' : point} : Bl a (l b p) c → Bl a' (l b' p') c' → eqa a b p a' b' p' →
eqa p b c p' b' c' → eqa a b c a' b'  c' :=
begin
intros h h1 h2 h3,
cases h.2.2.2 with d h4,
cases exists_of_exists_unique (six11 h2.2.2.1 h2.1.symm) with a₁ ha,
suffices : ∃ d₁, col b' p' d₁ ∧ (B p' b' d₁ ↔ B p b d) ∧ eqd b' d₁ b d,
  cases this with d₁ hd,
  cases seg_cons d₁ d c a₁ with c₁ hc,
  have h5 : eqd a d a₁ d₁,
    by_cases h_1 : d = b,
      subst d,
      have h_1 : b' = d₁,
        exact id_eqd b' d₁ b hd.2.2,
      subst d₁,
      exact ha.2.symm.flip,
    have h_2 : d₁ ≠ b',
      intro h_2,
      subst d₁,
      exact h_1 (id_eqd d b b' hd.2.2.symm.flip),
    suffices : eqa a b d a' b' d₁,
      rw eleven4 at this,
      apply this.2.2.2.2 a d a₁ d₁ (six5 h2.1) (six5 h_1) ha.1 (six5 h_2) ha.2.symm hd.2.2.symm,
    by_cases h_3 : B p b d,
      exact (eleven13 h2.flip h_1 h_3 h_2 (hd.2.1.2 h_3)).flip,
    let h4 := six4.2 ⟨(four11 h4.1).2.1, h_3⟩,
    have h5 : ¬B p' b' d₁,
      intro h_4,
      exact h_3 (hd.2.1.1 h_4),
    let h6 := six4.2 ⟨(four11 hd.1).2.1, h5⟩,
    exact eleven10 h2 (six5 h2.1) h4.symm (six5 ha.1.2.1) h6.symm,
  have h6 : eqd b c b' c₁,
    apply (afive_seg ⟨h4.2, hc.1, h5, hc.2.symm, ha.2.symm.flip, hd.2.2.symm.flip⟩ _).flip,
    intro h_1,
    subst d,
    exact h.2.1 h4.1,
  have h7 : eqa a b c a₁ b' c₁,
    apply eleven3.2 ⟨a, c, a₁, c₁, six5 h2.1, six5 h3.2.1, six5 ha.1.1, _⟩,
    split,
      apply six5 (two7 h6.flip h3.2.1),
    refine ⟨ha.2.symm.flip, h6, _⟩,
    exact two11 h4.2 hc.1 h5 hc.2.symm,
  apply eleven10 h7 (six5 h2.1) (six5 h3.2.1) ha.1.symm,
  have h8 : eqa p b c p' b' c₁,
    by_cases h_1 : d = b,
      subst d,
      have h_1 : b' = d₁,
        exact id_eqd b' d₁ b hd.2.2,
      subst d₁,
      apply (eleven13 _ h3.2.1 h4.2 (two7 hc.2.symm.flip h3.2.1) hc.1).flip,
      exact eleven10 h2 (six5 h2.1) (six5 h2.2.1) ha.1 (six5 h3.2.2.1),
     have h_2 : d₁ ≠ b',
      intro h_2,
      subst d₁,
      exact h_1 (id_eqd d b b' hd.2.2.symm.flip),
    suffices : eqa d b c d₁ b' c₁,
      by_cases h_3 : B p b d,
        exact (eleven13 this h2.2.1 h_3.symm h2.2.2.2.1 (hd.2.1.2 h_3).symm),
      let h8 := six4.2 ⟨(four11 h4.1).2.1, h_3⟩,
      have h9 : ¬B p' b' d₁,
        intro h_4,
        exact h_3 (hd.2.1.1 h_4),
      let h10 := six4.2 ⟨(four11 hd.1).2.1, h9⟩,
      exact eleven10 this h8 (six5 this.2.1) h10 (six5 this.2.2.2.1),
    apply eleven3.2 ⟨d, c, d₁, c₁, six5 h_1, six5 h3.2.1, six5 h_2, (six5 h7.2.2.2.1), _⟩,
    exact ⟨hd.2.2.symm.flip, h6, hc.2.symm⟩,
  have h9 : a₁ ∉ l b' p',
      intro h_1,
      apply h1.2.1,
      exact six20 h1.1 (six17a b' p') h_1 ha.1.1.symm (four11 (six4.1 ha.1).1).2.1,
  have h10 : c₁ ∉ l b' p',
    intro h_1,
    apply h9,
    apply six20 h1.1 h_1 hd.1 _ (or.inl hc.1.symm),
    apply two7 hc.2.symm.flip,
    intro h_2,
    subst d,
    exact h.2.2.1 h4.1,
  have h11 : side (l b' p') c' c₁,
    refine ⟨a₁, (nine5 h1 (six17a b' p') ha.1.symm).symm, _⟩,
    split,
      exact h1.1,
    refine ⟨h10, h9, _⟩,
    exact ⟨d₁, hd.1, hc.1.symm⟩,
  rw six17 at h,
  rw six17 at h10,
  apply eleven15b h.2.2.1 h10 c' c₁ h3 h11 h8,
  rw six17 b' p' at *,
  exact side.refl h1.1 h10,
by_cases h_1 : B p b d,
  simp [h_1],
  cases seg_cons b' b d p' with d₁ hd,
  exact ⟨d₁, or.inr (or.inr hd.1.symm), hd.1, hd.2⟩,
simp [h_1],
have h5 : sided b p d,
  exact six4.2 ⟨(four11 h4.1).2.1, h_1⟩,
cases exists_of_exists_unique (six11 h3.2.2.1 h5.2.1.symm) with d₁ hd,
exact ⟨d₁, (four11 (six4.1 hd.1).1).2.2.1, (six4.1 hd.1.symm).2, hd.2⟩
end

theorem eleven22b {a b c p a' b' c' p' : point} : side (l b p) a c → side (l b' p') a' c' → eqa a b p a' b' p' →
eqa p b c p' b' c' → eqa a b c a' b'  c' :=
begin
intros h h1 h2 h3,
apply eleven13 _ h2.1 (seven5 b a).1.symm h2.2.2.1 (seven5 b' a').1.symm,
have h4 : Bl a (l b p) (S b a),
  refine ⟨(nine11 h).1, (nine11 h).2.1, _, b, (six17a b p), (seven5 b a).1⟩,
  intro h_1,
  exact (nine11 h).2.1 ((seven24 (nine11 h).1 (six17a b p)).2 h_1),
have h5 : Bl a' (l b' p') (S b' a'),
  refine ⟨(nine11 h1).1, (nine11 h1).2.1, _, b', (six17a b' p'), (seven5 b' a').1⟩,
  intro h_1,
  exact (nine11 h1).2.1 ((seven24 (nine11 h1).1 (six17a b' p')).2 h_1),
apply (eleven22a _ _ (eleven13 h2 (seven12 h2.1.symm).symm ((seven5 b a).1) (seven12 h2.2.2.1.symm).symm (seven5 b' a').1) h3),
  exact ((nine8 h4).2 h).symm,
exact ((nine8 h5).2 h1).symm
end

def I (p a b c : point) : Prop := a ≠ b ∧ c ≠ b ∧ p ≠ b ∧ (B a b c ∨ ∃ x, B a x c ∧ sided b x p)

theorem eleven23a {a b c p : point} : I p a b c → B a b c ∨ ∃ q, a ≠ b ∧ c ≠ b ∧ q ≠ b ∧ B a q c ∧ sided b q p :=
begin
intro h,
cases h.2.2.2,
  exact or.inl h_1,
cases h_1 with q hq,
exact or.inr ⟨q, h.1, h.2.1, hq.2.1, hq.1, hq.2⟩
end

theorem eleven23b {p a b c : point} : ¬B a b c → I p a b c → a ≠ b ∧ c ≠ b ∧ p ≠ b ∧ ∃ x, B a x c ∧ sided b x p :=
begin
intros h h1,
unfold I at h1,
simpa [h] using h1
end

theorem eleven24 {p a b c : point} : I p a b c → I p c b a :=
begin
intro h,
refine ⟨h.2.1, h.1, h.2.2.1, _⟩,
cases h.2.2.2,
  exact or.inl h_1.symm,
right,
cases h_1 with x hx,
exact ⟨x, hx.1.symm, hx.2⟩
end

theorem eleven25 {p a b c a' c' p' : point} : I p a b c → sided b a' a → sided b c' c → sided b p' p → I p' a' b c' :=
begin
intros h h1 h2 h3,
by_cases h_1 : B a b c,
  exact ⟨h1.1, h2.1, h3.1, or.inl (six8 h1 h2 h_1)⟩,
replace h := eleven23b h_1 h,
cases h.2.2.2 with x hx,
have h4 : ∃ x', B c x' a' ∧ sided b x' x,
  cases h1.2.2,
    cases pasch b c a a' x h_2 hx.1.symm with x' hx',
    refine ⟨x', hx'.1.symm, _⟩,
    apply six7 hx'.2.symm,
    intro h_3,
    subst x',
    exact h_1 (six6 hx'.1.symm h1).symm,
  cases nine6 h_2.symm hx.1.symm with x' hx',
  exact ⟨x', hx'.1.symm, (six7 hx'.2 hx.2.1).symm⟩,
cases h4 with x' hx',
have h5 : ∃ y, B a' y c' ∧ sided b x' y,
  cases h2.2.2,
    cases pasch _ _ _ _ _ h_2 hx'.1.symm with y hy,
    refine ⟨y, hy.1.symm, _⟩,
    apply (six7 hy.2.symm _).symm,
    intro h_3,
    subst y,
    exact h_1 (six8 h1.symm h2.symm hy.1.symm),
  cases nine6 h_2.symm hx'.1.symm with y hy,
  exact ⟨y, hy.1.symm, (six7 hy.2 hx'.2.1)⟩,
cases h5 with y hy,
refine ⟨h1.1, h2.1, h3.1, or.inr ⟨y, hy.1,_⟩⟩,
exact hy.2.symm.trans (hx'.2.trans (hx.2.trans h3.symm))
end

theorem eleven26a {a b c : point} : a ≠ b → c ≠ b → I a a b c := 
λ h h1, ⟨h, h1, h, or.inr ⟨a, three3 a c, six5 h⟩⟩

theorem eleven26b {a b c : point} : a ≠ b → c ≠ b → I c a b c := 
λ h h1, ⟨h, h1, h1, or.inr ⟨c, three1 a c, six5 h1⟩⟩

lemma eleven28 {a b c d a' b' c' : point} : cong a b c a' b' c' → col a c d → 
∃ d', eqd a d a' d' ∧ eqd b d b' d' ∧ eqd c d c' d' :=
begin
intros h h1,
by_cases h_1 : a = c,
  subst c,
  have h_1 : a' = c',
    exact id_eqd a' c' a h.2.2.symm,
  subst c',
  by_cases h_1 : col a b d,
    cases four14 h_1 h.1 with d' hd,
    exact ⟨d', hd.2.2, hd.2.1, hd.2.2⟩,
  have h_2 : a' ≠ b',
    intro h_2,
    subst b',
    exact (six26 h_1).1 (id_eqd a b a' h.1),
  cases six25 h_2 with p' hp,
  cases exists_of_exists_unique (ten16 h_1 hp h.1) with d' hd,
  exact ⟨d', hd.1.2.2, hd.1.2.1, hd.1.2.2⟩,
cases four14 h1 h.2.2 with d' hd,
exact ⟨d', hd.2.2, (four16 ⟨h1, hd, h.1, h.2.1.flip ⟩ h_1).flip, hd.2.1⟩
end

def ang_le (a b c d e f : point) : Prop := ∃ p, I p d e f ∧ eqa a b c d e p

theorem eleven31 {a b c d e f : point} : sided b a c → d ≠ e → f ≠ e → ang_le a b c d e f :=
λ h h1 h2, ⟨d, ⟨h1, h2, h1, or.inr ⟨d, three3 d f, six5 h1⟩⟩, (eleven21a h).2 (six5 h1)⟩

theorem eleven32 {a b c d e f : point} : a ≠ b → c ≠ b → d ≠ e → f ≠ e → B d e f → ang_le a b c d e f :=
begin
intros h h1 h2 h3 h4,
  by_cases h_1 : col a b c,
  cases six1 h_1,
    exact ⟨f, ⟨h2, h3, h3, or.inl h4⟩, eleven21c h h1 h2 h3 h_2 h4⟩,
  exact eleven31 h_2 h2 h3,
cases exists_of_exists_unique (six11 h h2.symm) with a' ha,
cases six25 h2 with x hx,
suffices : ¬col a' b c,
  cases (exists_of_exists_unique (ten16 this hx ha.2.flip)) with p hp,
  refine ⟨p, ⟨h2, h3, two7 hp.1.2.1.flip h1, or.inl h4⟩, _⟩, 
  exact (eleven9 ha.1 (six5 h1)).trans (eleven11 ha.1.1 h1 hp.1),
intro h_2,
exact h_1 (four11 (five4 ha.1.1.symm (four11 h_2).2.1 (four11 (six4.1 ha.1).1).2.1)).2.2.2.1
end

theorem eleven30 {a b c d e f a' b' c' d' e' f' : point} : ang_le a b c d e f → eqa a b c a' b' c' → 
eqa d e f d' e' f' → ang_le a' b' c' d' e' f' :=
begin
rintros ⟨p, hp⟩ h1 h2,
rcases eleven5.1 h2 with ⟨d₁, f₁, hd, hf, h⟩,
cases hp.1.2.2.2,
  exact eleven32 h1.2.2.1 h1.2.2.2.1 h2.2.2.1 h2.2.2.2.1 (eleven21b h_1 h2),
cases h_1 with x hx,
cases four5 hx.1 h.2.2 with y hy,
have h3 : eqd e x e' y,
  apply (four2 ⟨hx.1, hy.1, h.2.2, hy.2.2.1, h.1, h.2.1.flip⟩).flip,
suffices : ang_le a b c d₁ e' f₁,
  unfold ang_le at *,
  cases this with r hr,
  refine ⟨r, eleven25 hr.1 hd.symm hf.symm (six5 hr.1.2.2.1), _⟩,
  exact h1.symm.trans (hr.2.trans (eleven9 hd.symm (six5 hr.1.2.2.1))),
refine ⟨y, ⟨hd.1, hf.1, two7 h3.flip hx.2.1, or.inr ⟨y, hy.1, six5 (two7 h3.flip hx.2.1)⟩⟩, _⟩, 
apply hp.2.trans ((eleven9 (six5 h2.1) hx.2).trans (eleven11 h2.1 hx.2.1 ⟨h.1, h3, hy.2.1⟩))
end

theorem eleven29 {a b c d e f : point} : ang_le a b c d e f ↔ ∃ q, I c a b q ∧ eqa a b q d e f :=
begin
  split,
  rintros ⟨p, hp, h⟩,
  by_cases h_1 : B d e f,
    refine ⟨S b a, ⟨h.1, (seven12 h.1.symm).symm, h.2.1, or.inl (seven5 b a).1⟩, _⟩,
    exact eleven21c h.1 (seven12 h.1.symm).symm hp.1 hp.2.1 (seven5 b a).1 h_1,
  unfold I at hp,
  simp [h_1, - ne.def] at hp,
  cases hp.2.2.2 with x hx,
  have h1 : eqa a b c d e x,
    exact eleven10 h (six5 h.1) (six5 h.2.1) (six5 h.2.2.1) hx.2,
  rcases eleven5.1 h1.symm with ⟨a', c', h2, h3, h4⟩,
  cases eleven28 h4 (or.inl hx.1) with q hq,
  existsi q,
  suffices : I c' a' b q ∧ eqa a' b q d e f,
    refine ⟨eleven25 this.1 h2.symm (six5 this.1.2.1).symm h3.symm, _⟩,
    exact eleven10 this.2 h2.symm (six5 this.2.2.1) (six5 this.2.2.2.1) (six5 this.2.2.2.2.1), 
  have h5 : B a' c' q,
    exact four6 hx.1 ⟨h4.2.2, hq.2.2, hq.1⟩,
  refine ⟨⟨h2.1, (two7 hq.2.1.flip hp.2.1), h3.1, or.inr ⟨c', h5, six5 h3.1⟩⟩, _⟩,
  have h6 : eqa c' b q x e f,
    exact eleven11 h3.1 (two7 hq.2.1.flip hp.2.1) ⟨h4.2.1.symm.flip, hq.2.1.symm, hq.2.2.symm⟩,
  by_cases h_2 : col d e x,
    have h7 : sided e d x,
      apply six4.2 ⟨h_2, _⟩, 
      intro h_3,
      exact h_1 (three6b h_3 hx.1),
    apply eleven10 h6 _ (six5 h6.2.1) h7 (six5 h6.2.2.2.1),
    exact six10a h7 ⟨h4.1.flip, h4.2.2, h4.2.1⟩,
  by_cases h_3 : col x e f,
    have h7 : sided e x f,
      apply six4.2 ⟨h_3, _⟩, 
      intro h_4,
      exact h_1 (three5b hx.1 h_4),
    apply eleven10 (eleven11 h2.1 h3.1 h4.symm) (six5 h2.1) _ (six5 h.2.2.1) h7.symm,
    exact six10a h7.symm ⟨hq.2.1, hq.2.2.flip, h4.2.1⟩,
  apply eleven22a _ _ (eleven11 h2.1 h3.1 h4.symm) h6,
    unfold Bl,
    refine ⟨six14 h3.1.symm, _, _, c', six17b b c', h5⟩,
      intro h_4,
      exact h_2 (four13 (four11 h_4).2.2.2.1 h4.symm),
    intro h_4,
    exact h_3 (eleven21d (four11 h_4).2.1 h6),
  refine ⟨six14 hx.2.1.symm, (four10 h_2).2.2.1, (four10 h_3).2.1, x, six17b e x, hx.1⟩,
rintros ⟨q, h, h1⟩,
apply eleven30 _ (eqa.refl h.1 h.2.2.1) h1,
exact ⟨c, h, (eqa.refl h.1 h.2.2.1)⟩
end

theorem eleven33 {a b c d e f : point} : ang_le a b c d e f → a ≠ b ∧ c ≠ b ∧ d ≠ e ∧ f ≠ e :=
λ ⟨p, hp⟩, ⟨hp.2.1, hp.2.2.1, hp.1.1, hp.1.2.1⟩

theorem ang_le.refl {a b c : point} : a ≠ b → c ≠ b → ang_le a b c a b c :=
λ h h1, ⟨c, eleven26b h h1, eqa.refl h h1⟩

theorem ang_le.trans {a b c d e f x y z : point} : ang_le a b c d e f → ang_le d e f x y z → 
ang_le a b c x y z :=
begin
intros h h1,
rcases h1 with ⟨q, h2, h3⟩,
  cases h2.2.2.2,
  exact eleven32 (eleven33 h).1 (eleven33 h).2.1 h2.1 h2.2.1 h_1,
cases h_1 with r hr,
replace h3 := eleven10 h3 (six5 h3.1) (six5 h3.2.1) (six5 h3.2.2.1) hr.2,
replace h := eleven30 h (eqa.refl (eleven33 h).1 (eleven33 h).2.1) h3,
rcases h with ⟨s, hs, h4⟩,
cases hs.2.2.2,
  exact eleven32 h4.1 h4.2.1 h2.1 h2.2.1 (three6b h hr.1),
cases h with p hp,
refine ⟨p, ⟨h2.1, h2.2.1, hp.2.1, or.inr ⟨p, three6b hp.1 hr.1, six5 hp.2.1⟩⟩, _⟩,
exact eleven10 h4 (six5 h4.1) (six5 h4.2.1) (six5 h4.2.2.1) hp.2
end

theorem eleven34 {a b c d e f : point} : ang_le a b c d e f → ang_le d e f a b c → eqa a b c d e f :=
begin
rintros ⟨p, h, h1⟩ h2,
by_cases h_1 : B d e f,
  apply eleven21c h1.1 h1.2.1 h.1 h.2.1 _ h_1,
  rcases h2 with ⟨q, h2, h3⟩,
  cases eleven23a h2,
    exact h_2,
  cases h_2 with r hr,
  apply three6b (eleven21b h_1 _) hr.2.2.2.1,
  exact eleven10 h3 (six5 h3.1) (six5 h3.2.1) (six5 h3.2.2.1) hr.2.2.2.2,
rcases eleven29.1 h2 with ⟨q, h4, h3⟩,
replace h2 := eleven23a h4,
clear h4,
cases h2,
  exfalso,
  cases (eleven23b h_1 h).2.2.2 with r hr,
  exact h_1 (three6b (six6 (eleven21b h2 (h3.trans h1)) hr.2.symm) hr.1),
cases h2 with t ht,
have h4 : ¬B d e t,
  intro h_2,
  exact h_1 (six6 h_2 ht.2.2.2.2),
cases (eleven23b h4 (eleven25 h (six5 h.1) ht.2.2.2.2 (six5 h.2.2.1))).2.2.2 with r hr,
replace h1 := eleven10 h1 (six5 h1.1) (six5 h1.2.1) (six5 h1.2.2.1) hr.2,
apply eleven10 _ (six5 h3.2.2.1) (six5 h3.2.2.2.1) (six5 h3.1) ht.2.2.2.2.symm,
by_cases h_2 : col a b c,
  cases six1 h_2,
    apply eleven21c h1.1 h1.2.1 ht.1 ht.2.2.2.2.1 h_3,
    exact three6b (eleven21b h_3 h1) hr.1,
  exact (eleven21a h_3).2 (six6a ((eleven21a h_3).1 h3.symm) ht.2.2.2.1),
suffices : sided e r q,
  apply eleven10 h1 (six5 h1.1) (six5 h1.2.1) (six5 h1.2.2.1) _,
  exact (six6a this (three6a hr.1 ht.2.2.2.1)).symm,
have h5 : ¬col d e r,
  intro h_3,
  exact h_2 (eleven21d h_3 h1.symm),
apply eleven15b h_2 h5 r q h1 (side.refl (six14 ht.1.symm) (four10 h5).2.1) h3.symm,
apply (nine19 (six14 ht.1.symm) (six17b e d) (or.inl (three6b hr.1 ht.2.2.2.1).symm)).2,
refine ⟨(six7 (three6b hr.1 ht.2.2.2.1) (six26 h5).2.2.symm).symm, _⟩,
intro h_3,
exact h5 (eleven21d (four11 h_3).2.1 (h3.trans h1))
end

theorem eleven35 {a b c d e f : point} : a ≠ b → c ≠ b → d ≠ e → f ≠ e → ang_le a b c d e f ∨ ang_le d e f a b c :=
begin
intros h h1 h2 h3,
by_cases h4 : col a b c,
  cases six1 h4,
    exact or.inr (eleven32 h2 h3 h h1 h_1),
  exact or.inl (eleven31 h_1 h2 h3),
by_cases h5 : col d e f,
  cases six1 h5,
    exact or.inl (eleven32 h h1 h2 h3 h_1),
  exact or.inr (eleven31 h_1 h h1),
rcases eleven15a h5 h4 with ⟨c', h6, hc⟩,
have h7 : c' ∈ pl (l b c) a,
  suffices : pl (l b a) c = pl (l b c) a,
    exact this ▸ (or.inl hc),
  exact (nine24 (four10 h4).2.1).1,
cases h7,
  cases (nine31 hc h7).2.2.2 with x hx,
  refine or.inr ⟨c', ⟨h, h1, h6.2.2.2.1, or.inr ⟨x, hx.2, _⟩⟩, h6⟩,
  apply ((nine19 (six14 h.symm) (six17a b a) (four11 hx.1).2.2.2.2).1 _).1,
  apply nine19a hc.symm (six17b b a) (six7 hx.2 _),
  intro h_1,
  subst x,
  exact (nine11 hc).2.1 (four11 hx.1).1,
suffices : ∃ x, col b c x ∧ B c' x a,
  cases this with x hx,
  refine or.inl (eleven29.2 ⟨c', ⟨h, h6.2.2.2.1, h1, or.inr ⟨x, hx.2.symm, _⟩⟩, h6.symm⟩),
  apply ((nine19 (six14 h.symm) (six17a b a) (four11 hx.1).2.2.2.2).1 _).1,
  apply nine19a hc (six17b b a) (six7 hx.2.symm _),
  intro h_1,
  subst x,
  exact (nine11 hc).2.2 (four11 hx.1).1,
cases h7,
  exact ⟨c', h7, three3 c' a⟩,
exact h7.symm.2.2.2
end

lemma eleven36a {a b c d e f a' d' : point} : a' ≠ b → d' ≠ e → B a b a' → B d e d' → 
ang_le a b c d e f → ang_le d' e f a' b c :=
begin
intros h h1 h2 h3 h4,
by_cases h_1 : col a b c,
  cases six1 h_1,
    suffices : B d e f,
      apply eleven31 _ h (eleven33 h4).2.1,
      exact ⟨h1, (eleven33 h4).2.2.2, five2 (eleven33 h4).2.2.1 h3 this⟩,
    exact eleven21b h_2 (eleven34 h4 (eleven32 (eleven33 h4).2.2.1 (eleven33 h4).2.2.2 (eleven33 h4).1 (eleven33 h4).2.1 h_2)),
  apply eleven32 h1 (eleven33 h4).2.2.2 h (eleven33 h4).2.1 _,
  exact six6 h2.symm h_2,
cases eleven29.1 h4 with p hp,
cases hp.1.2.2.2,
  suffices : B d e f,
    apply eleven31 _ h (eleven33 h4).2.1,
    exact ⟨h1, (eleven33 h4).2.2.2, five2 (eleven33 h4).2.2.1 h3 this⟩,
  exact eleven21b h_2 hp.2,
cases h_2 with y hy,
by_cases h_2 : y = p,
  subst y,
  apply eleven30 (ang_le.refl h (eleven33 h4).2.1) _ (eqa.refl h (eleven33 h4).2.1),
  exact eleven13 (eleven10 hp.2 (six5 hp.2.1) hy.2.symm (six5 hp.2.2.2.1) (six5 hp.2.2.2.2.1)) h h2 h1 h3,
refine ⟨p, ⟨h, hp.1.2.2.1, hp.1.2.1, or.inr _⟩, (eleven13 hp.2 h h2 h1 h3).symm⟩,
have h5 : side (l b p) a c,
  apply (nine19a _ (six17a b p) hy.2.symm).symm,
  apply (nine19 (six14 hp.2.2.1.symm) (six17b b p) (or.inr (or.inr hy.1.symm))).2 ⟨six7 hy.1.symm h_2, _⟩,
  intro h_3,
  apply h_1 (six23.2 ⟨l b p, (six14 hp.2.2.1.symm), _, (six17a b p), _⟩),
    rw (six18 (six14 hp.2.2.1.symm) h_2 h_3 (six17b b p)),
    exact or.inr (or.inr hy.1),
  rw (six18 (six14 hp.2.2.1.symm) hy.2.1 h_3 (six17a b p)),
  exact (six4.1 hy.2).1,
have h6 : Bl c (l b p) a',
  apply (nine8 ⟨(nine11 h5).1, (nine11 h5).2.1, _, ⟨b, (six17a b p), h2⟩⟩).2 h5,
  intro h_3,
  apply (nine11 h5).2.1,
  rw (six18 ((nine11 h5).1) h h_3 (six17a b p)),
  exact or.inl h2.symm,
cases h6.2.2.2 with x hx,
refine ⟨x, hx.2.symm, six4.2 ⟨(four11 hx.1).2.2.2.1, _⟩⟩,
intro h_3,
suffices : side (l a b) c p,
  have h6 : side (l a b) x p,
    apply nine19a this (or.inl h2) (six7 hx.2.symm _),
    intro h_4,
    subst x,
    exact h6.2.2.1 (or.inr (or.inr h_3)),
  apply (nine9 _) h6,
  exact ⟨(nine11 h6).1, (nine11 h6).2.1, (nine11 h6).2.2, ⟨b, (six17b a b), h_3⟩⟩,
have h7 : side (l a b) c y,
  exact (nine19 (six14 (six26 h_1).1) (six17b a b) (four11 (six4.1 hy.2).1).2.2.2.1).2 ⟨hy.2.symm, h_1⟩,
apply (nine19a h7.symm (six17a a b) _).symm,
apply (six7 hy.1 _).symm,
intro h_4,
subst y,
exact (nine11 h7).2.2 (six17a a b)
end

theorem eleven36 {a b c d e f a' d' : point} : a ≠ b → a' ≠ b → d ≠ e → d' ≠ e → B a b a' → B d e d' → 
(ang_le a b c d e f ↔ ang_le d' e f a' b c) :=
begin
intros h h1 h2 h3 h4 h5, 
split,
  intro h6,
  exact eleven36a h1 h3 h4 h5 h6,
intro h6,
exact eleven36a h2 h h5.symm h4.symm h6
end

def ang_lt (a b c d e f : point) : Prop := ang_le a b c d e f ∧ ¬eqa a b c d e f

theorem eleven37 {a b c d e f a' b' c' d' e' f' : point} : ang_lt a b c d e f → eqa a b c a' b' c' → 
eqa d e f d' e' f' → ang_lt a' b' c' d' e' f' :=
begin
rintros ⟨h, h1⟩ h2 h3,
refine ⟨eleven30 h h2 h3, _⟩,
intro h_1,
exact h1 (h2.trans (h_1.trans h3.symm))
end

theorem eleven38a {a b c d e f : point} : ang_lt a b c d e f ↔ a ≠ b ∧ c ≠ b ∧ d ≠ e ∧ f ≠ e ∧ ¬ang_le d e f a b c :=
begin
split,
  rintros ⟨⟨p, h, h1⟩, h2⟩,
  refine ⟨h1.1, h1.2.1, h1.2.2.1, h.2.1, _⟩,
  intro h3,
  exact h2 (eleven34 ⟨p, h, h1⟩ h3),
rintros ⟨h, h1, h2, h3, h4⟩,
split,
  simpa [h4] using (eleven35 h h1 h2 h3),
intro h_1,
exact h4 (eleven30 (ang_le.refl h h1) h_1 (eqa.refl h h1))
end

theorem eleven38b {a b c d e f : point} : ang_lt a b c d e f → ang_lt d e f a b c → false :=
begin
intros h h1,
suffices : ¬ang_lt d e f a b c,
  exact this h1,
intro h_1,
exact (eleven38a.1 h).2.2.2.2 h_1.1
end

theorem eleven39 {a b c d e f a' d' : point} : a ≠ b → a' ≠ b → d ≠ e → d' ≠ e → B a b a' → B d e d' → 
(ang_lt a b c d e f ↔ ang_lt d' e f a' b c) :=
begin
intros h h1 h2 h3 h4 h5,
split,
  intro h6,
  refine ⟨(eleven36 h h1 h2 h3 h4 h5).1 h6.1, _⟩,
  intro h_1,
  exact h6.2 (eleven13 h_1.symm h h4.symm h2 h5.symm),
intro h6,
refine ⟨(eleven36 h h1 h2 h3 h4 h5).2 h6.1, _⟩,
intro h_1,
exact h6.2 (eleven13 h_1.symm h3 h5 h1 h4)
end

theorem ang_lt.trans {a b c d e f x y z : point} : ang_lt a b c d e f → ang_lt d e f x y z → ang_lt a b c x y z :=
begin
intros h h1,
refine ⟨ang_le.trans h.1 h1.1, _⟩,
intro h_1,
replace h1 := eleven37 h1 (eqa.refl (eleven38a.1 h1).1 (eleven38a.1 h1).2.1) h_1.symm,
exact eleven38b h h1
end

def acute (a b c : point) : Prop := ∃ x y z, R x y z ∧ ang_lt a b c x y z

theorem acute.symm {a b c : point} : acute a b c → acute c b a :=
begin
rintros ⟨x, y, z, h, h1⟩,
refine ⟨x, y, z, h, (eleven37 h1 (eleven8 (eleven38a.1 h1).1 (eleven38a.1 h1).2.1) _)⟩,
exact (eqa.refl (eleven38a.1 h1).2.2.1 (eleven38a.1 h1).2.2.2.1)
end

theorem eleven40a {a b c : point} : sided b a c → acute a b c :=
begin
intro h,
cases eight25 h.1 with d hd,
refine ⟨a, b, d, hd.1, eleven31 h h.1 hd.2, _⟩,
intro h1,
cases (eight9 hd.1 (six4.1 ((eleven21a h).1 h1)).1),
  exact h.1 h_1,
exact hd.2 h_1
end

def obtuse (a b c : point) : Prop := ∃ x y z, R x y z ∧ ang_lt x y z a b c

theorem obtuse.symm {a b c : point} : obtuse a b c → obtuse c b a :=
begin
rintros ⟨x, y, z, h, h1⟩,
refine ⟨x, y, z, h, (eleven37 h1 _ (eleven8 (eleven38a.1 h1).2.2.1 (eleven38a.1 h1).2.2.2.1))⟩,
exact (eqa.refl (eleven38a.1 h1).1 (eleven38a.1 h1).2.1)
end

theorem eleven40b {a b c : point} : a ≠ b → c ≠ b → B a b c → obtuse a b c :=
begin
intros h h1 h2,
cases eight25 h with d hd,
refine ⟨a, b, d, hd.1, eleven32 h hd.2 h h1 h2, _⟩,
intro h3,
cases (eight9 hd.1 (or.inl ((eleven21b h2) h3.symm))),
  exact h h_1,
exact hd.2 h_1
end

lemma eleven41a {a b c d : point} : ¬col a b c → B b a d → d ≠ a → ang_lt a c b c a d :=
begin
intros h h1 h2,
generalize h3 : S (mid a c) b = p,
have h4 : eqa a c b c a p,
  suffices : eqa a c b (S (mid a c) a) (S (mid a c) c) (S (mid a c) b),
    rwa [h3, midtoS a c, mid.symm a c, midtoS c a] at this,
  exact eleven12 (mid a c) (six26 h).2.2 (six26 h).2.1,
cases pasch d (S (mid a c) b) b a (mid a c) h1.symm (seven5 (mid a c) b).1.symm with x hx,
rw h3 at hx,
have h5 : I p c a d,
  suffices : I p (mid a c) a d,
    apply eleven25 this (six7 (ten1 a c).1 _).symm (six5 this.2.1) (six5 this.2.2.1),
    exact mid.neq (six26 h).2.2,
  have h6 : x ≠ a,
    intro h_1,
    subst x,
    apply h (six23.2 ⟨l d a, six14 h2,(six17b d a), or.inl h1.symm, _⟩),
    exact or.inl (three7b hx.2.symm (ten1 a c).1 (mid.neq (six26 h).2.2).symm),
  refine ⟨mid.neq (six26 h).2.2 , h2, _, or.inr ⟨x, hx.2, (six7 hx.1 h6)⟩⟩,
  exact (six7 hx.1 h6).2.1,
refine ⟨⟨p, h5, h4⟩, _⟩,
intro h_1,
suffices h7 : side (l a c) d p,
  suffices : ¬col d a p,
    have h8 : ¬sided a d p,
      intro h_2,
      exact this (six4.1 h_2).1,
    apply h8 (eleven15b (four10 h).1 (four10 (nine11 h7).2.1).2.1 d p h_1 _ h4 h7.symm),
    exact side.trans h7 h7.symm,
  intro h_2,
  apply h (six23.2 ⟨l d a, six14 h2,(six17b d a), or.inl h1.symm, _⟩),
  rw ←midtoS a c,
  apply (seven24 (six14 h2) _).1 (six17b d a),
  apply six27 (six14 h2) (or.inl h1.symm) h_2,
  rw ←h3,
  exact (seven5 (mid a c) b).1,
refine ⟨b, ⟨six14 (six26 h).2.2, _, (four10 h).1, ⟨a, (six17a a c), h1.symm⟩⟩, ⟨six14 (six26 h).2.2, _⟩⟩,
  intro h_2,
  exact h (six23.2 ⟨l d a, six14 h2,(six17b d a), or.inl h1.symm, (four11 h_2).2.2.2.1⟩),
subst p,
refine ⟨_, (four10 h).1, ⟨(mid a c), or.inr (or.inl (ten1 a c).1.symm), (seven5 (mid a c) b).1.symm⟩⟩,
intro h_2,
exact (four10 h).1 ((seven24 (six14 (six26 h).2.2) (or.inr (or.inl (ten1 a c).1.symm))).2 h_2),
end

theorem eleven41 {a b c d : point} : ¬col a b c → B b a d → d ≠ a → ang_lt a c b c a d ∧ ang_lt a b c c a d :=
begin
intros h h1 h2,
refine ⟨eleven41a h h1 h2, _⟩,
have h3 : eqa c a d b a (S a c),
  apply ((eleven8 h2 (six26 h).2.2.symm).trans _).flip,
  apply eleven14 (six26 h).2.2.symm h2 (seven12 (six26 h).2.2).symm (six26 h).1.symm _ h1.symm,
  exact (seven5 a c).1,
apply eleven37 _ (eqa.refl (six26 h).1 (six26 h).2.1.symm) h3.symm,
exact eleven41a (four10 h).1 (seven5 a c).1 (seven12 (six26 h).2.2).symm
end

theorem eleven42 {a b c d: point} : B a b d → (d ≠ b ∧ acute a b c ↔ a ≠ b ∧ obtuse d b c) :=
begin
intros h,
split,
  rintros ⟨h1, h2⟩,
  rcases h2 with ⟨x, y, z, h2, ⟨h3, h4⟩⟩,
  have h5 : ang_le (S y x) y z d b c,
    exact eleven36a h1 (seven12 (eleven33 h3).2.2.1.symm).symm h (seven5 y x).1 h3,
  refine ⟨(eleven33 h3).1, S y x, y, z, h2.symm.flip.symm, ⟨h5, _⟩⟩,
  intro h_1,
  exact h4 (eleven13 h_1.symm (eleven33 h3).1 h.symm (eleven33 h3).2.2.1 (seven5 y x).1.symm),
rintros ⟨h1, h2⟩,
rcases h2 with ⟨x, y, z, h2, ⟨h3, h4⟩⟩,
have h5 : ang_le a b c (S y x) y z,
  exact eleven36a (seven12 (eleven33 h3).1.symm).symm h1 (seven5 y x).1 h.symm h3,
refine ⟨(eleven33 h3).2.2.1, S y x, y, z, h2.symm.flip.symm, ⟨h5, _⟩⟩,
intro h_1,
exact h4 (eleven13 h_1.symm (eleven33 h3).1 (seven5 y x).1.symm (eleven33 h3).2.2.1 h)
end

theorem eleven43 {a b c : point} : ¬col a b c → (R b a c ∨ obtuse b a c) → acute a b c ∧ acute a c b :=
begin
intros h h1,
let h2 := eleven41 h (seven5 a b).1 (seven12 (six26 h).1).symm,
cases h1,
  refine ⟨⟨c, a, (S a b), h1.symm.flip, _⟩, c, a, (S a b), h1.symm.flip, _⟩,
    exact h2.2,
  exact h2.1,
suffices : acute c a (S a b),
  rcases this with ⟨x, y, z, h3, h4⟩,
  refine ⟨⟨x, y, z, h3, h2.2.trans h4⟩, x, y, z, h3, h2.1.trans h4⟩,
exact ((eleven42 (seven5 a b).1.symm).2 ⟨(seven12 (six26 h).1).symm, h1⟩).2.symm
end

end Euclidean_plane

--default for eleven25, mid.neq, or.elim
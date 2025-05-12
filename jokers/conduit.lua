SMODS.Joker { --conduit
  key = 'conduit',
  
  in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_mult') or SMODS.has_enhancement(playing_card, 'm_bonus') then
        return true
      end
    end
    return false
  end,
  
  cost = 4,
  rarity = 1,
  atlas = 'T.Jokers',
  pos = { x = 5, y = 0 },
  eternal_compat = true,
  perishable_compat = true,
  blueprint_compat = true,
  config = { extra = { chips = 30, mult = 4 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
    info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
    return {vars = { card.ability.extra.chips, card.ability.extra.mult } }
  end,
  
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      if context.other_card.ability.name == "Bonus" then
        return {
          mult = card.ability.extra.mult,
          card = context.other_card
        }
      elseif context.other_card.ability.name == "Mult" then
        return {
          chips = card.ability.extra.chips,
          card = context.other_card
        }
      end
    end
  end
}
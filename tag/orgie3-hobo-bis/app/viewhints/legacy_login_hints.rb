class LegacyLoginHints < Hobo::ViewHints
	field_names :m_sNome => "Il tuo nome", 
			:m_sPwd => "Your goliardic name",
			:m_dataIscrizione => "Data d'iscrizione",
			:m_hEmail => "La tua email",
      :m_bGuest => 'Ospite',
      :m_bIsGoliard => "E' goliarda"
	field_help  :m_sNome => "HELP Il tuo nome",
			:m_sPwd => "La tua password"



   #children :messages, :links
   
end

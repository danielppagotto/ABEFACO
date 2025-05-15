#Fazendo a coluna imunizacao e fazendo o slider para cada grupo de vacinas 
pop_shy2$imunizacao <- 0
pop_shy2$imunizacao[pop_shy2$vacinas == "BCG"] <- pop_shy2$populacao[pop_shy2$vacinas == "BCG"] * (input$percentual_1 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Hepatite B"] <- pop_shy2$populacao[pop_shy2$vacinas == "Hepatite B"] * (input$percentual_2 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Penta"] <- pop_shy2$populacao[pop_shy2$vacinas == "Penta"] * (input$percentual_3 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Poliomielite VIP"] <- pop_shy2$populacao[pop_shy2$vacinas == "Poliomielite VIP"] * (input$percentual_4 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Pneumo 10v"] <- pop_shy2$populacao[pop_shy2$vacinas == "Pneumo 10v"] * (input$percentual_5 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "VRH"] <- pop_shy2$populacao[pop_shy2$vacinas == "VRH"] * (input$percentual_6 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "DT"] <- pop_shy2$populacao[pop_shy2$vacinas == "DT"] * (input$percentual_7 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Poliomielite VOP"] <- pop_shy2$populacao[pop_shy2$vacinas == "Poliomielite VOP"] * (input$percentual_8 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Meningo C"] <- pop_shy2$populacao[pop_shy2$vacinas == "Meningo C"] * (input$percentual_9 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Tríplice Viral"] <- pop_shy2$populacao[pop_shy2$vacinas == "Tríplice Viral"] * (input$percentual_10 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Treta Viral"] <- pop_shy2$populacao[pop_shy2$vacinas == "Treta Viral"] * (input$percentual_11 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Hepatite A"] <- pop_shy2$populacao[pop_shy2$vacinas == "Hepatite A"] * (input$percentual_12 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "VFA"] <- pop_shy2$populacao[pop_shy2$vacinas == "VFA"] * (input$percentual_13 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Varicela"] <- pop_shy2$populacao[pop_shy2$vacinas == "Varicela"] * (input$percentual_14 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "HPV4"] <- pop_shy2$populacao[pop_shy2$vacinas == "HPV4"] * (input$percentual_15 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Meningo ACWY"] <- pop_shy2$populacao[pop_shy2$vacinas == "Meningo ACWY"] * (input$percentual_16 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Covid-19"] <- pop_shy2$populacao[pop_shy2$vacinas == "Covid-19"] * (input$percentual_17 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "dt/Dupla Adulto"] <- pop_shy2$populacao[pop_shy2$vacinas == "dt/Dupla Adulto"] * (input$percentual_18 / 100)




pop_shy2 <- pop_shy2 %>%
  mutate(vacina = case_when(
    vacina == "BCG" & faixa_etaria == "2 meses" ~ paste(vacina, "- unica"),
    vacina == "Hepatite B" & faixa_etaria == "2 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "Penta" & faixa_etaria == "2 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "Penta" & faixa_etaria == "4 meses" ~ paste(vacina, "- 2 dose"),
    vacina == "Penta" & faixa_etaria == "6 meses" ~ paste(vacina, "- 3 dose"),
    vacina == "Meningo C" & faixa_etaria == "3 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "Meningo C" & faixa_etaria == "5 meses" ~ paste(vacina, "- 2 dose"),
    vacina == "Meningo C" & faixa_etaria == "1 ano" ~ paste(vacina, "- 1 dose reforço"),
    vacina == "Meningo ACWY" & faixa_etaria == "11 anos" ~ paste(vacina, "- 1 dose ou reforço"),
    vacina == "Meningo ACWY" & faixa_etaria == "12 anos" ~ paste(vacina, "- 1 dose ou reforço"),
    vacina == "Meningo ACWY" & faixa_etaria == "13 anos" ~ paste(vacina, "- 1 dose ou reforço"),
    vacina == "Meningo ACWY" & faixa_etaria == "14 anos" ~ paste(vacina, "- 1 dose ou reforço"),
    vacina == "Pneumo 10v" & faixa_etaria == "2 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "Pneumo 10v" & faixa_etaria == "4 meses" ~ paste(vacina, "- 2 dose"),
    vacina == "Pneumo 10v" & faixa_etaria == "1 ano" ~ paste(vacina, "- 1 dose reforço"),
    vacina == "VRH" & faixa_etaria == "2 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "VRH" & faixa_etaria == "4 meses" ~ paste(vacina, "- 2 dose"),
    vacina == "VFA" & faixa_etaria == "9 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "VFA" & faixa_etaria == "4 anos" ~ paste(vacina, "- 2 dose"),
    vacina == "covid-19" & faixa_etaria == "6 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "covid-19" & faixa_etaria == "7 meses" ~ paste(vacina, "- 2 dose"),
    vacina == "covid-19" & faixa_etaria == "9 meses" ~ paste(vacina, "- 3 dose"),
    vacina == "Varicela" & faixa_etaria == "4 anos" ~ paste(vacina, "- 1 dose"),
    vacina == "dt/Dupla Adulto" & faixa_etaria == "7 anos" ~ paste(vacina, "- 1 dose"),
    vacina == "HPV4" & faixa_etaria == "9 anos" ~ paste(vacina, "- 1 e 2 doses"),
    vacina == "HPV4" & faixa_etaria == "10 anos" ~ paste(vacina, "- 1 e 2 doses"),
    vacina == "HPV4" & faixa_etaria == "11 anos" ~ paste(vacina, "- 1 e 2 doses"),
    vacina == "HPV4" & faixa_etaria == "12 anos" ~ paste(vacina, "- 1 e 2 doses"),
    vacina == "HPV4" & faixa_etaria == "13 anos" ~ paste(vacina, "- 1 e 2 doses"),
    vacina == "HPV4" & faixa_etaria == "14 anos" ~ paste(vacina, "- 1 e 2 doses"),
    vacina == "Tríplice Viral" & faixa_etaria == "1 ano" ~ paste(vacina, "- 1 dose"),
    vacina == "Treta Viral" & faixa_etaria == "1 ano" ~ paste(vacina, "- 1 dose"),
    vacina == "Hepatite A" & faixa_etaria == "1 ano" ~ paste(vacina, "- 1 dose"),
    vacina == "Poliomielite VOP" & faixa_etaria == "2 meses" ~ paste(vacina, "- 1 dose"),
    vacina == "Poliomielite VOP" & faixa_etaria == "4 meses" ~ paste(vacina, "- 2 dose"),
    vacina == "Poliomielite VOP" & faixa_etaria == "6 meses" ~ paste(vacina, "- 3 dose"),
    vacina == "Poliomielite VOP" & faixa_etaria == "1 ano" ~ paste(vacina, "- 1 dose reforço"),
    vacina == "Poliomielite VOP" & faixa_etaria == "4 anos" ~ paste(vacina, "- 2 dose reforço"),
    
    
    TRUE ~ vacina
  ))



pop_shy2$imunizacao <- 0
pop_shy2$imunizacao[pop_shy2$vacinas == "BCG- unica"] <- pop_shy2$populacao[pop_shy2$vacinas == "BCG- unica"] * (input$percentual_1 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Hepatite B- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Hepatite B- 1 dose"] * (input$percentual_2 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Penta- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Penta- 1 dose"] * (input$percentual_3 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Penta- 2 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Penta- 2 dose"] * (input$percentual_4 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Penta- 3 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Penta- 3 dose"] * (input$percentual_5 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Poliomielite VIP- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Poliomielite VIP- 1 dose"] * (input$percentual_6 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Poliomielite VIP- 2 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Poliomielite VIP- 2 dose"] * (input$percentual_7 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Poliomielite VIP- 3 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Poliomielite VIP- 3 dose"] * (input$percentual_8 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Pneumo 10v- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Pneumo 10v- 1 dose"] * (input$percentual_9 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Pneumo 10v- 2 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Pneumo 10v- 2 dose"] * (input$percentual_10 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Pneumo 10v- 1 dose reforco"] <- pop_shy2$populacao[pop_shy2$vacinas == "Pneumo 10v- 1 dose reforco"] * (input$percentual_11 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "VRH- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "VRH- 1 dose"] * (input$percentual_12 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "VRH- 2 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "VRH- 2 dose"] * (input$percentual_13 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "DTP- 1 dose reforco"] <- pop_shy2$populacao[pop_shy2$vacinas == "DT- 1 dose reforco"] * (input$percentual_14 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "DTP- 2 dose reforco"] <- pop_shy2$populacao[pop_shy2$vacinas == "DT- 2 dose reforco"] * (input$percentual_15 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Poliomielite VOP- 1 dose reforco"] <- pop_shy2$populacao[pop_shy2$vacinas == "Poliomielite VOP- 1 dose reforco"] * (input$percentual_16 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Poliomielite VOP- 2 dose reforco"] <- pop_shy2$populacao[pop_shy2$vacinas == "Poliomielite VOP- 2 dose reforco"] * (input$percentual_17 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Meningo C- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Meningo C- 1 dose"] * (input$percentual_18 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Meningo C- 2 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Meningo C- 2 dose"] * (input$percentual_19 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Meningo C- 1 dose reforco"] <- pop_shy2$populacao[pop_shy2$vacinas == "Meningo C- 1 dose reforco"] * (input$percentual_20 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Tríplice Viral- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Tríplice Viral- 1 dose"] * (input$percentual_21 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Treta Viral- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Treta Viral- 1 dose"] * (input$percentual_22 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Hepatite A- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Hepatite A- 1 dose"] * (input$percentual_23 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "VFA- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "VFA- 1 dose"] * (input$percentual_24 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "VFA- 2 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "VFA- 2 dose"] * (input$percentual_25 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Varicela- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Varicela- 1 dose"] * (input$percentual_26 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "HPV4- 1 e 2 doses"] <- pop_shy2$populacao[pop_shy2$vacinas == "HPV4- 1 e 2 doses"] * (input$percentual_27 / 100)

pop_shy2$imunizacao[pop_shy2$vacinas == "Meningo ACWY- 1 dose ou reforco"] <- pop_shy2$populacao[pop_shy2$vacinas == "Meningo ACWY- 1 dose ou reforco"] * (input$percentual_28 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Covid-19- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Covid-19- 1 dose"] * (input$percentual_29 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Covid-19- 2 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Covid-19- 2 dose"] * (input$percentual_30 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "Covid-19- 3 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "Covid-19- 3 dose"] * (input$percentual_31 / 100)
pop_shy2$imunizacao[pop_shy2$vacinas == "dt/Dupla Adulto- 1 dose"] <- pop_shy2$populacao[pop_shy2$vacinas == "dt/Dupla Adulto- 1 dose"] * (input$percentual_32 / 100)

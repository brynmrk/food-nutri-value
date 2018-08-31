# Retention Code AND Food Group Code AND Retention Description
[['0001', '01', 'CHEESE,BAKED'], ['0003', '01', 'CHEESE,BROILED'], ['0005', '01', 'CHEESE,COOKED W/LIQUID'], ['0007', '01', 'CHEESE,REHEATED'], ['0101', '01', 'EGGS,BAKED'],
  ['0103', '01', 'EGGS,FRIED,SCRAMBLED'], ['0105', '01''EGGS,HARD COOKED'], ['0107', '01', 'EGGS,POACHED'], ['0109', '01', 'EGGS,REHEATED'], ['2151', '01', 'MILK,HEATED APPROX 10MIN'],
  ['2152', '01', 'MILK,HEATED APPROX 30MIN'], ['2153', '01', 'MILK,HEATED APPROX 1HOUR'], ['2154', '01', 'MILK REHEATED'], ['0801', '05', 'CHICKEN,BROILED'],
  ['0803', '05', 'CHICKEN,FRIEND,W/O COATING'], ['0804', '05', 'CHICKEN,FRIEND,W/COATING'], ['0805', '05', 'CHICKEN,ROASTED'], ['0851', '05', 'CHICKEN,BROWN,SIMMER,W/DRIPPINGS'],
  ['0852', '05', 'CHICKEN,SIMMERED,W/O DRIPPINGS'], ['0855', '05', 'CHICKEN,SIMMERED,W/DRIPPINGS'], ['0856', '05', 'CHICKEN,REHEATED'], ['0864', '05', 'TURKEY,ROASTED'],
  ['1805', '05', 'TURKEY,SIMMERED,W/O DRIPPINGS'], ['1851', '05', 'TURKEY,SIMMERED,W/DRIPPINGS'], ['1852', '05', 'TURKEY,REHEATED'], ['1860', '05', 'OATMEAL,INST,COOKED'],
  ['0351', '08', 'OATMEAL,REG/QUICK,COOKED'], ['0352', '08', 'CEREAL,INST,COOKED'], ['0357', '08', 'CEREAL,REG/QUICK,COOKED'], ['0358', '08'], ['0151', '09', 'FRUITS,FRESH(NOT CITRUS),BAKED'],
  ['0152', '09', 'FRUITS,FRESH(NOT CITRUS),BROILED'], ['0153', '09', 'FRUITS,FRESH(NOT CITRUS),SAUTEED'], ['0154', '09', 'FRUITS,CANNED'], ['0155', '09', 'FRUITS,FRESH(NOT CITRUS),STEWED'],
  ['0156', '09', 'FRUITS,FROZEN'], ['0157', '09', 'FRUITS,FRESH(NOT CITRUS),REHEATED'], ['0158', '09', 'FRUITS,DRIED'], ['0251', '09', 'FRUITS(DRIED),BAKED'], ['0253', '09', 'FRUITS(DRIED),SAUTEED'],
  ['0255', '09', 'FRUITS(DRIED),STEWED'], ['0257', '09', 'FRUITS(DRIED),REHEATED'], ['0270', '09', 'FRUITS,CITRUS,CKD'], ['1251', '10','PORK,FRESH,BROILED'],
  ['1252', '10', 'PORK,FRESH,FRIED,W/O COATING'], ['1253', '10', 'PORK,FRESHFRIED,W/COATING']].each do |food_code_grp_code|
  food = Food.create(ret_code: food_code_grp_code[0], food_grp_code: food_code_grp_code[1], ret_desc: food_code_grp_code[2])
  FoodNutrients::NUTRIENTS.each do |nutrient_name|
    Nutrient.create(name: nutrient_name, level: rand(100), food: food)
  end
end

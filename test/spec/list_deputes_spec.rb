require_relative '../lib/list_deputes'

#describe "the perform method" do
#  it "should return a no nill array" do
#    expect(perform).not_to be_nil
#  end
#end


describe "the get_depute_urls" do
  it "should return an array of two arrays" do
    expect(get_depute_urls.length).to eq(2)
  end

end

describe "the get_depute_indos methods" do
  it "should return a hash with the depute information" do
    expect(get_depute_infos('/deputes/fiche/OMC_PA719866','Mme Caroline Abadie')).to eq({"first_name"=>"Caroline", "last_name"=>"Abadie", "email"=>"caroline.abadie@assemblee-nationale.fr"})
    expect(get_depute_infos('/deputes/fiche/OMC_PA606171','M. Richard Ferrand')).to eq({"first_name"=>"Richard", "last_name"=>"Ferrand", "email"=>"richard.ferrand@assemblee-nationale.fr"})
    expect(get_depute_infos('/deputes/fiche/OMC_PA267780','Mme Agnès Firmin Le Bodo')).to eq({"first_name"=>"Agnès", "last_name"=>"Firmin Le Bodo", "email"=>"agnes.firminlebodo@assemblee-nationale.fr"})
    expect(get_depute_infos('/deputes/fiche/OMC_PA721996','M. Patrick Loiseau')).to eq({"first_name"=>"Patrick", "last_name"=>"Loiseau", "email"=>"Aucun email"})
  end
end

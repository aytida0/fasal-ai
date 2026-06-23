// Agronomic data for one model output class.
class DiseaseInfo {
  final String cropName;
  final bool isHealthy;

  // Human-readable disease name. Null when [isHealthy] is true.
  final String? diseaseName;

  // 1-2 sentence description shown on the diagnosis card.
  final String diagnosis;

  final List<String> treatments;
  final List<String> prevention;

  const DiseaseInfo({
    required this.cropName,
    required this.isHealthy,
    required this.diseaseName,
    required this.diagnosis,
    required this.treatments,
    required this.prevention,
  });
}

// Static knowledge base mapping every model class label to its [DiseaseInfo].
// Keys must match [CropLabels.labels] exactly.

class DiseaseKnowledgeBase {
  DiseaseKnowledgeBase._();

  static const Map<String, DiseaseInfo> data = {

    // Corn

    'Corn___Common_Rust': DiseaseInfo(
      cropName: 'Corn',
      isHealthy: false,
      diseaseName: 'Common Rust',
      diagnosis:
          'Common rust is caused by the fungus Puccinia sorghi. It produces '
          'brick-red, oval pustules scattered across both leaf surfaces, '
          'reducing photosynthetic capacity and yield.',
      treatments: [
        'Apply foliar fungicide (azoxystrobin or propiconazole) at first pustule sign',
        'Repeat spray every 14 days if disease pressure remains high',
        'Remove and destroy heavily infected leaves to reduce spore load',
        'Avoid excess nitrogen fertilisation that encourages lush, susceptible tissue',
      ],
      prevention: [
        'Plant rust-resistant hybrid varieties suited to your region',
        'Scout fields weekly during warm (16–23 °C), humid conditions',
        'Maintain balanced soil fertility; excess N increases susceptibility',
        'Rotate with non-host crops to lower inoculum in the field',
      ],
    ),

    'Corn___Gray_Leaf_Spot': DiseaseInfo(
      cropName: 'Corn',
      isHealthy: false,
      diseaseName: 'Gray Leaf Spot',
      diagnosis:
          'Gray leaf spot (Cercospora zeae-maydis) produces rectangular, tan-gray '
          'lesions with wavy parallel edges that run along leaf veins. Severe '
          'infections cause significant defoliation and yield loss.',
      treatments: [
        'Apply strobilurin or triazole fungicide when lower leaves show early lesions',
        'Improve air circulation by reducing plant density where feasible',
        'Avoid overhead irrigation which prolongs leaf wetness',
        'Destroy crop residue after harvest to break the disease cycle',
      ],
      prevention: [
        'Choose hybrids with confirmed gray leaf spot resistance ratings',
        'Practice tillage to bury infected residue before planting',
        'Rotate corn with soybean or other non-host crops for at least one season',
        'Monitor fields in warm (25–30 °C), humid weather with extended dew periods',
      ],
    ),

    'Corn___Healthy': DiseaseInfo(
      cropName: 'Corn',
      isHealthy: true,
      diseaseName: null,
      diagnosis:
          'Your corn crop appears healthy with no visible signs of fungal, '
          'bacterial, or viral disease. Continue current management practices.',
      treatments: [],
      prevention: [
        'Scout weekly for early pest and disease signs',
        'Maintain balanced soil nutrition (N, P, K)',
        'Ensure adequate drainage to prevent waterlogging stress',
        'Keep field edges free of weed hosts that harbour pathogens',
      ],
    ),

    'Corn___Northern_Leaf_Blight': DiseaseInfo(
      cropName: 'Corn',
      isHealthy: false,
      diseaseName: 'Northern Leaf Blight',
      diagnosis:
          'Northern leaf blight (Exserohilum turcicum) causes long, cigar-shaped, '
          'tan lesions (5–15 cm) with wavy margins on corn leaves. Heavy '
          'infection before tasselling severely reduces grain fill.',
      treatments: [
        'Apply foliar fungicide (propiconazole, pyraclostrobin) at tasselling if disease is present',
        'Remove severely blighted leaves to improve air circulation',
        'Avoid waterlogged soils; improve field drainage',
        'Do not leave infected crop residue on the soil surface',
      ],
      prevention: [
        'Select hybrids with Ht1/Ht2 resistance genes for your target region',
        'Rotate crops to reduce fungal spore levels in the soil',
        'Till and bury crop residue after harvest',
        'Apply prophylactic fungicide in regions with a history of severe blight',
      ],
    ),

    // cotton

    'Cotton___Bacterial_Blight': DiseaseInfo(
      cropName: 'Cotton',
      isHealthy: false,
      diseaseName: 'Bacterial Blight',
      diagnosis:
          'Bacterial blight (Xanthomonas citri pv. malvacearum) causes angular, '
          'water-soaked lesions on leaves that turn dark brown with a yellow halo. '
          'It can spread to bolls and reduce lint quality significantly.',
      treatments: [
        'Apply copper-based bactericide (copper hydroxide) at first symptom appearance',
        'Remove and destroy heavily infected plant parts immediately',
        'Avoid working in fields when foliage is wet to prevent spread',
        'Reduce plant stress by ensuring adequate irrigation and nutrition',
      ],
      prevention: [
        'Plant certified disease-free, acid-delinted seed',
        'Use resistant cotton varieties where available',
        'Avoid overhead irrigation; use drip or furrow irrigation',
        'Rotate cotton with non-host crops for at least two seasons',
      ],
    ),

    'Cotton___Curl_Virus': DiseaseInfo(
      cropName: 'Cotton',
      isHealthy: false,
      diseaseName: 'Cotton Leaf Curl Virus',
      diagnosis:
          'Cotton leaf curl disease (CLCuV) is transmitted by the whitefly '
          'Bemisia tabaci. Infected plants show upward or downward leaf curling, '
          'vein thickening, and enations on the underside of leaves, leading to '
          'severely reduced boll set.',
      treatments: [
        'Control whitefly populations with imidacloprid or thiamethoxam spray',
        'Remove and destroy infected plants early to prevent spread',
        'Apply reflective mulch to deter whitefly settlement',
        'Use yellow sticky traps to monitor and reduce adult whitefly numbers',
      ],
      prevention: [
        'Plant CLCuV-tolerant cotton varieties (e.g., NIAB, CIM series)',
        'Avoid late planting which coincides with peak whitefly populations',
        'Maintain field hygiene; destroy volunteer cotton and weedy hosts',
        'Apply neem-based spray at seedling stage for early whitefly control',
      ],
    ),

    'Cotton___Fusarium_Wilt': DiseaseInfo(
      cropName: 'Cotton',
      isHealthy: false,
      diseaseName: 'Fusarium Wilt',
      diagnosis:
          'Fusarium wilt (Fusarium oxysporum f. sp. vasinfectum) is a soilborne '
          'fungal disease causing yellowing of leaves on one or both sides of the '
          'plant, followed by wilting and death. Vascular discolouration '
          '(brown staining) is visible when stems are cut.',
      treatments: [
        'There is no curative treatment once plants are infected; remove and destroy wilted plants',
        'Drench soil around healthy nearby plants with carbendazim to reduce spread',
        'Avoid wounding roots during cultivation which allows fungal entry',
        'Improve soil drainage; Fusarium thrives in waterlogged conditions',
      ],
      prevention: [
        'Plant Fusarium-wilt-resistant or tolerant cotton varieties',
        'Treat seed with thiram or captan fungicide before sowing',
        'Rotate with cereal crops for 3–4 years to reduce soil inoculum',
        'Maintain soil pH between 6.0–6.5; acidic soils favour Fusarium',
        'Avoid over-irrigation and soil compaction',
      ],
    ),

    'Cotton___Healthy': DiseaseInfo(
      cropName: 'Cotton',
      isHealthy: true,
      diseaseName: null,
      diagnosis:
          'Your cotton crop looks healthy with no detectable signs of bacterial, '
          'viral, or fungal disease. Maintain current agronomic practices.',
      treatments: [],
      prevention: [
        'Scout weekly for whitefly, aphids, and early disease symptoms',
        'Maintain balanced NPK fertilisation to avoid stress',
        'Use certified disease-free seed in subsequent seasons',
        'Rotate crops and practice good field sanitation',
      ],
    ),

    // ── POTATO ───────────────────────────────────────────────────────────────

    'Potato___Early_Blight': DiseaseInfo(
      cropName: 'Potato',
      isHealthy: false,
      diseaseName: 'Early Blight',
      diagnosis:
          'Early blight (Alternaria solani) presents as dark brown, concentric '
          'ring lesions ("target spots") with yellow halos on older lower leaves. '
          'It progresses upward, causing premature defoliation and reduced tuber yield.',
      treatments: [
        'Apply mancozeb or chlorothalonil fungicide at first lesion appearance',
        'Repeat spray every 7–10 days during warm, wet conditions',
        'Remove and compost infected leaves away from the field',
        'Avoid overhead irrigation; irrigate at the base of plants early in the day',
      ],
      prevention: [
        'Use certified, disease-free seed tubers',
        'Plant resistant or tolerant potato varieties',
        'Ensure adequate potassium fertilisation to improve plant immunity',
        'Practice 2–3 year crop rotation with non-solanaceous crops',
      ],
    ),

    'Potato___Healthy': DiseaseInfo(
      cropName: 'Potato',
      isHealthy: true,
      diseaseName: null,
      diagnosis:
          'Your potato crop appears healthy with no signs of fungal or viral '
          'disease. Continue monitoring and maintain good agronomic practices.',
      treatments: [],
      prevention: [
        'Scout fields every 5–7 days during humid weather',
        'Use certified seed potato free of virus and blight',
        'Hill plants adequately to prevent tuber greening and disease entry',
        'Avoid prolonged leaf wetness by using drip irrigation',
      ],
    ),

    'Potato___Late_Blight': DiseaseInfo(
      cropName: 'Potato',
      isHealthy: false,
      diseaseName: 'Late Blight',
      diagnosis:
          'Late blight (Phytophthora infestans) is one of the most destructive '
          'potato diseases. It produces water-soaked, dark brown lesions on leaves '
          'with a characteristic white mold fringe underneath in humid conditions. '
          'Can destroy an entire crop within days if untreated.',
      treatments: [
        'Apply metalaxyl + mancozeb or cymoxanil immediately upon first sign',
        'Repeat spray every 5–7 days; alternate fungicides to prevent resistance',
        'Remove and destroy all infected plant material — do NOT compost',
        'Harvest tubers quickly if foliage is severely affected',
        'Store harvested tubers in a cool, dry, well-ventilated place',
      ],
      prevention: [
        'Plant certified, late-blight-resistant varieties (e.g., Sarpo series)',
        'Use prophylactic copper fungicide spray at canopy closure',
        'Avoid overhead irrigation; water early morning so foliage dries by afternoon',
        'Destroy volunteer potato plants and solanaceous weeds',
        'Monitor local blight forecasting services and act at first warning',
      ],
    ),

    // ── RICE ─────────────────────────────────────────────────────────────────

    'Rice___Brown_Spot': DiseaseInfo(
      cropName: 'Rice',
      isHealthy: false,
      diseaseName: 'Brown Spot',
      diagnosis:
          'Brown spot (Cochliobolus miyabeanus) produces oval to circular brown '
          'lesions with a white or gray centre and yellow halo on rice leaves. '
          'It is often associated with nutrient-stressed, particularly '
          'potassium-deficient, crops.',
      treatments: [
        'Apply tricyclazole or mancozeb fungicide at booting stage',
        'Apply potassium fertiliser to correct nutritional deficiency',
        'Drain and re-flood the field to reduce fungal inoculum in standing water',
        'Remove severely infected tillers to limit spread',
      ],
      prevention: [
        'Use disease-free certified seed; hot-water seed treatment at 52 °C for 10 min',
        'Ensure balanced NPK fertilisation, especially potassium',
        'Plant in well-drained fields with good water management',
        'Avoid water stress, especially during the grain-filling stage',
      ],
    ),

    'Rice___Healthy': DiseaseInfo(
      cropName: 'Rice',
      isHealthy: true,
      diseaseName: null,
      diagnosis:
          'Your rice crop appears healthy with no visible disease lesions. '
          'Maintain current water and nutrient management practices.',
      treatments: [],
      prevention: [
        'Maintain consistent water depth appropriate to growth stage',
        'Apply recommended NPK dose; avoid excess nitrogen which invites blast',
        'Scout regularly for leaf discolouration or lesion appearance',
        'Use certified disease-free seed each season',
      ],
    ),

    'Rice___Leaf_Blast': DiseaseInfo(
      cropName: 'Rice',
      isHealthy: false,
      diseaseName: 'Leaf Blast',
      diagnosis:
          'Leaf blast (Magnaporthe oryzae) causes diamond-shaped lesions with '
          'gray centres and dark brown borders on rice leaves. Under high humidity '
          'and cool nights, it spreads rapidly and can kill entire tillers at '
          'the seedling stage.',
      treatments: [
        'Spray tricyclazole 75 WP (0.6 g/L) at first lesion appearance',
        'Repeat spray after 10–14 days if conditions remain favourable for blast',
        'Reduce nitrogen topdressing — high N worsens blast severity',
        'Drain the field for 2–3 days to reduce humidity at the canopy level',
      ],
      prevention: [
        'Plant blast-resistant rice varieties (IR-64, BPT-5204 etc. for your region)',
        'Seed treat with carbendazim 50 WP before sowing',
        'Avoid excessive nitrogen application, especially urea',
        'Maintain proper spacing to improve air circulation within the crop',
      ],
    ),

    'Rice___Neck_Blast': DiseaseInfo(
      cropName: 'Rice',
      isHealthy: false,
      diseaseName: 'Neck Blast',
      diagnosis:
          'Neck blast (Magnaporthe oryzae) attacks the neck of the rice panicle, '
          'causing it to turn brown or black and break. The panicle fails to fill '
          'grain, resulting in "white ear" symptom. It is the most yield-damaging '
          'form of blast.',
      treatments: [
        'Apply propiconazole or isoprothiolane at 50% heading to protect the panicle',
        'If neck blast is already visible, spray tricyclazole immediately',
        'Do not apply high-nitrogen fertiliser after heading; this worsens blast',
        'Avoid waterlogging; maintain shallow, intermittent irrigation at heading',
      ],
      prevention: [
        'Time fungicide application at panicle initiation and again at heading',
        'Use blast-resistant varieties to reduce disease pressure',
        'Ensure phosphorus and potassium nutrition are adequate before heading',
        'Avoid planting in low-lying, mist-prone areas during cool seasons',
      ],
    ),

    // ── SUGARCANE ────────────────────────────────────────────────────────────

    'Sugarcane___Healthy': DiseaseInfo(
      cropName: 'Sugarcane',
      isHealthy: true,
      diseaseName: null,
      diagnosis:
          'Your sugarcane crop appears healthy with vigorous green canes and no '
          'signs of fungal, viral, or bacterial disease.',
      treatments: [],
      prevention: [
        'Use disease-free, certified setts for planting',
        'Scout the crop monthly for early signs of mosaic, rust, or red rot',
        'Maintain proper inter-row spacing and weed control',
        'Apply balanced NPK fertilisation per soil test recommendations',
      ],
    ),

    'Sugarcane___Mosaic': DiseaseInfo(
      cropName: 'Sugarcane',
      isHealthy: false,
      diseaseName: 'Sugarcane Mosaic',
      diagnosis:
          'Sugarcane mosaic is caused by Sugarcane mosaic virus (SCMV) transmitted '
          'by aphids. Infected leaves show an irregular yellow-green mosaic '
          'mottling pattern. Severely affected plants are stunted with reduced '
          'sugar content in the stalk.',
      treatments: [
        'Remove and destroy infected plants immediately to prevent aphid spread',
        'Control aphid vectors with imidacloprid or thiamethoxam spray',
        'Do not use setts from infected fields for replanting',
        'Sanitise cutting tools between stools to prevent mechanical transmission',
      ],
      prevention: [
        'Plant mosaic-resistant or tolerant varieties (Co, CoJ series as appropriate)',
        'Use certified virus-free setts for planting',
        'Control aphid populations early in the season with systemic insecticides',
        'Remove weed hosts (grasses) from field margins which harbour the virus',
      ],
    ),

    'Sugarcane___Red_Rot': DiseaseInfo(
      cropName: 'Sugarcane',
      isHealthy: false,
      diseaseName: 'Red Rot',
      diagnosis:
          'Red rot (Colletotrichum falcatum) is one of the most serious sugarcane '
          'diseases. The internal stalk tissue turns red with white transverse '
          'patches when cut open. Infected canes emit a sour, alcoholic smell '
          'and rapidly deteriorate in quality.',
      treatments: [
        'Immediately rogue out and destroy all infected stools — do NOT crush or leave in field',
        'Drench soil around removed stools with copper oxychloride solution',
        'Avoid ratoon crops from infected fields; replant with healthy setts',
        'Disinfect cutting implements with 5% formalin between cuts',
      ],
      prevention: [
        'Plant only certified, red-rot-resistant varieties',
        'Treat setts with carbendazim 50 WP (0.1%) for 15 minutes before planting',
        'Ensure good drainage; waterlogged soils favour Colletotrichum',
        'Harvest on time; over-mature cane is highly susceptible to red rot',
      ],
    ),

    'Sugarcane___Rust': DiseaseInfo(
      cropName: 'Sugarcane',
      isHealthy: false,
      diseaseName: 'Sugarcane Rust',
      diagnosis:
          'Sugarcane rust (Puccinia melanocephala) produces elongated, orange-brown '
          'pustules on the underside of leaves with corresponding yellow flecks on '
          'the upper surface. Severe infection causes premature leaf death and '
          'reduced sugar yield.',
      treatments: [
        'Apply triadimefon or propiconazole fungicide at first pustule appearance',
        'Spray at 14-day intervals during cool, wet conditions that favour rust',
        'Remove and destroy heavily rusted leaves to reduce spore spread',
        'Ensure balanced potassium fertilisation which strengthens cell walls',
      ],
      prevention: [
        'Plant rust-resistant commercial varieties for your growing region',
        'Avoid high plant density that reduces air circulation',
        'Scout the lower canopy regularly in cool, humid weather',
        'Destroy ratoon stubble from infected fields before replanting',
      ],
    ),

    'Sugarcane___Yellow': DiseaseInfo(
      cropName: 'Sugarcane',
      isHealthy: false,
      diseaseName: 'Yellow Leaf Disease',
      diagnosis:
          'Yellow leaf disease (Sugarcane yellow leaf virus — ScYLV) causes '
          'yellowing of the midrib on the underside of leaves, progressing to '
          'the upper surface. Infected plants show reduced vigour and yield loss '
          'of 10–30% in susceptible varieties.',
      treatments: [
        'Remove and destroy severely symptomatic leaves to reduce aphid infestation',
        'Control Melanaphys sacchari (yellow sugarcane aphid) with dimethoate or imidacloprid',
        'Avoid using infected setts for propagation',
        'No curative chemical treatment exists; focus on vector control and variety replacement',
      ],
      prevention: [
        'Plant ScYLV-tolerant or resistant varieties',
        'Use meristem-cultured, virus-indexed planting material',
        'Apply systemic insecticide at planting to protect early growth from aphid vectors',
        'Maintain strict field hygiene and remove weed grasses that harbour aphids',
      ],
    ),

    // ── TOMATO ───────────────────────────────────────────────────────────────

    'Tomato___Bacterial_Spot': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: false,
      diseaseName: 'Bacterial Spot',
      diagnosis:
          'Bacterial spot (Xanthomonas campestris pv. vesicatoria) causes small, '
          'dark, water-soaked spots on leaves, stems, and fruit. Spots have a '
          'greasy appearance and are surrounded by yellow halos. Severe infection '
          'causes defoliation and unmarketable fruit.',
      treatments: [
        'Spray copper hydroxide or copper oxychloride bactericide every 7 days',
        'Tank-mix copper with mancozeb for better disease suppression',
        'Remove and destroy infected leaves and fruit immediately',
        'Avoid working in the field when plants are wet',
      ],
      prevention: [
        'Use certified disease-free transplants or treat seed with hot water (50 °C, 25 min)',
        'Plant resistant or tolerant tomato varieties',
        'Use drip irrigation to keep foliage dry',
        'Rotate with non-solanaceous crops for at least 2 years',
      ],
    ),

    'Tomato___Early_Blight': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: false,
      diseaseName: 'Early Blight',
      diagnosis:
          'Early blight (Alternaria solani) shows as dark brown concentric-ring '
          '"target" lesions on older lower leaves. Lesions are surrounded by '
          'yellow chlorotic tissue. It also affects stems and fruit, causing '
          'collar rot and fruit rot at the stem end.',
      treatments: [
        'Apply mancozeb 75 WP or chlorothalonil every 7–10 days from first symptom',
        'Remove and compost infected lower leaves to slow upward spread',
        'Stake or cage plants to improve air circulation',
        'Avoid excessive nitrogen fertilisation that produces overly succulent tissue',
      ],
      prevention: [
        'Use certified disease-free transplants; mulch soil to prevent splash-up',
        'Water at the base of plants in the morning; avoid overhead irrigation',
        'Apply preventive fungicide spray starting at transplanting in high-risk seasons',
        'Practice 3-year rotation with non-solanaceous crops',
      ],
    ),

    'Tomato___Healthy': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: true,
      diseaseName: null,
      diagnosis:
          'Your tomato plants appear healthy with no signs of bacterial, fungal, '
          'or viral disease. Continue monitoring and maintain good cultural practices.',
      treatments: [],
      prevention: [
        'Scout plants twice a week for early lesion or pest signs',
        'Stake plants and prune suckers to improve air circulation',
        'Use drip irrigation to reduce leaf wetness',
        'Rotate tomatoes with unrelated crops each season',
      ],
    ),

    'Tomato___Late_Blight': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: false,
      diseaseName: 'Late Blight',
      diagnosis:
          'Late blight (Phytophthora infestans) produces large, greasy, dark '
          'water-soaked lesions on leaves that rapidly turn brown-black. A white '
          'mold fringe appears on lesion edges in humid conditions. The disease '
          'can kill an entire tomato planting within a week.',
      treatments: [
        'Apply metalaxyl + mancozeb or cymoxanil + mancozeb immediately',
        'Spray every 5–7 days; rotate fungicide modes of action to prevent resistance',
        'Remove all infected plant material — bag and dispose, do NOT compost',
        'Avoid wetting foliage; switch to drip irrigation if using sprinklers',
      ],
      prevention: [
        'Plant late-blight-resistant tomato varieties (e.g., Mountain Merit, Jasper)',
        'Apply preventive copper fungicide at transplanting in high-risk areas',
        'Monitor online blight forecasting services (e.g., BlightCast)',
        'Destroy volunteer tomato and potato plants near the field',
      ],
    ),

    'Tomato___Leaf_Mold': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: false,
      diseaseName: 'Leaf Mold',
      diagnosis:
          'Leaf mold (Passalora fulva) causes pale green-yellow spots on the '
          'upper leaf surface with a distinctive olive-green to brown velvety '
          'mold on the underside. It thrives in high-humidity greenhouses and '
          'polytunnels, causing defoliation and yield loss.',
      treatments: [
        'Apply chlorothalonil, mancozeb, or copper-based fungicide every 7 days',
        'Immediately improve ventilation in greenhouses; reduce humidity below 85%',
        'Remove and destroy infected leaves to reduce spore load',
        'Avoid overhead misting that creates conditions favourable to leaf mold',
      ],
      prevention: [
        'Plant leaf-mold-resistant tomato varieties (Cf-resistant gene series)',
        'Maintain greenhouse humidity below 85% with adequate ventilation',
        'Space plants generously (60–90 cm) to reduce canopy density',
        'Prune lower leaves regularly and remove crop debris promptly',
      ],
    ),

    'Tomato___Septoria_Leaf_Spot': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: false,
      diseaseName: 'Septoria Leaf Spot',
      diagnosis:
          'Septoria leaf spot (Septoria lycopersici) produces numerous small '
          '(3–5 mm) circular spots with dark brown borders and tan-gray centres. '
          'Tiny black pycnidia are visible in the centre of each spot. '
          'It starts on lower leaves and progresses rapidly upward, causing '
          'severe defoliation.',
      treatments: [
        'Apply mancozeb, chlorothalonil, or copper fungicide every 7–10 days',
        'Remove infected lower leaves as soon as spots appear',
        'Stake plants to keep foliage off the ground',
        'Avoid splashing water during irrigation',
      ],
      prevention: [
        'Mulch soil under plants to prevent rain-splash of soilborne spores',
        'Use drip irrigation exclusively; do not wet foliage',
        'Rotate tomatoes with non-solanaceous crops for 2–3 years',
        'Start preventive fungicide programme before disease appearance in warm, wet seasons',
      ],
    ),

    'Tomato___Tomato_Mosaic_Virus': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: false,
      diseaseName: 'Tomato Mosaic Virus',
      diagnosis:
          'Tomato mosaic virus (ToMV) causes bright yellow-green mosaic mottling '
          'on leaves, often with leaf distortion, fern-leaf symptom, and stunted '
          'growth. Fruit may show internal browning. ToMV is highly stable and '
          'easily spread through handling and contaminated tools.',
      treatments: [
        'Remove and destroy all visibly infected plants immediately',
        'There is no chemical cure; focus on containing spread through hygiene',
        'Sanitise hands and tools with 10% trisodium phosphate or 1% bleach solution',
        'Control aphids and other sucking insects that may facilitate spread',
      ],
      prevention: [
        'Plant ToMV-resistant tomato varieties (Tm-2 or Tm-22 resistance gene)',
        'Use certified virus-indexed seed; do NOT save seed from infected plants',
        'Disinfect transplanting trays, stakes, and tools before use',
        'Avoid smoking near tomato plants (tobacco is a ToMV host)',
      ],
    ),

    'Tomato___Yellow_Leaf_Curl_Virus': DiseaseInfo(
      cropName: 'Tomato',
      isHealthy: false,
      diseaseName: 'Yellow Leaf Curl Virus',
      diagnosis:
          'Tomato yellow leaf curl virus (TYLCV) is transmitted by the silverleaf '
          'whitefly (Bemisia argentifolii). Infected plants show upward curling '
          'and cupping of leaves, chlorotic leaf margins, and severe stunting. '
          'Fruits are few, small, and unmarketable.',
      treatments: [
        'Remove and destroy infected plants at once — they are a permanent virus reservoir',
        'Spray imidacloprid or spiromesifen to suppress whitefly populations',
        'Apply reflective silver mulch between rows to deter whiteflies',
        'Install fine insect-proof mesh (50-mesh) in nursery and greenhouse structures',
      ],
      prevention: [
        'Plant TYLCV-resistant or tolerant varieties (e.g., Ty-1 gene series)',
        'Use yellow sticky traps to monitor whitefly entry into the field',
        'Apply systemic insecticide at transplanting for early protection',
        'Maintain a weed-free buffer zone around the field to remove whitefly hosts',
      ],
    ),

    // ── WHEAT ────────────────────────────────────────────────────────────────

    'Wheat___Brown_Rust': DiseaseInfo(
      cropName: 'Wheat',
      isHealthy: false,
      diseaseName: 'Brown Rust (Leaf Rust)',
      diagnosis:
          'Wheat brown rust (Puccinia triticina) produces small, circular-to-oval '
          'orange-brown uredinia (pustules) scattered randomly on the leaf surface '
          'and sheath. Severe infection causes premature leaf senescence and '
          'significant grain yield and quality losses.',
      treatments: [
        'Apply propiconazole or tebuconazole fungicide at first pustule observation',
        'Repeat spray 14 days later if conditions remain humid and warm',
        'Apply at flag leaf stage for maximum economic return',
        'Scout fields at 5-day intervals during mild (15–22 °C), humid weather',
      ],
      prevention: [
        'Grow rust-resistant wheat varieties approved for your agro-climatic zone',
        'Time planting to avoid peak rust infection periods',
        'Apply prophylactic fungicide in areas with a known rust history',
        'Monitor regional rust alerts and act at the first sighting of pustules',
      ],
    ),

    'Wheat___Healthy': DiseaseInfo(
      cropName: 'Wheat',
      isHealthy: true,
      diseaseName: null,
      diagnosis:
          'Your wheat crop appears healthy with no visible signs of rust, '
          'smut, or Fusarium disease. Continue current agronomic practices.',
      treatments: [],
      prevention: [
        'Scout fields weekly from tillering through grain fill',
        'Use certified, treated seed to prevent seed-borne diseases',
        'Apply balanced NPK fertilisation per soil test; avoid excess nitrogen',
        'Rotate wheat with pulses or oilseeds to break disease cycles',
      ],
    ),

    'Wheat___Yellow_Rust': DiseaseInfo(
      cropName: 'Wheat',
      isHealthy: false,
      diseaseName: 'Yellow Rust (Stripe Rust)',
      diagnosis:
          'Yellow rust (Puccinia striiformis f. sp. tritici) is characterised by '
          'bright yellow-orange pustules arranged in distinct longitudinal stripes '
          'along the leaf veins. It thrives in cool (7–12 °C), moist conditions '
          'and can devastate crops within 2–3 weeks if left uncontrolled.',
      treatments: [
        'Apply propiconazole 25 EC or tebuconazole at first stripe symptom — act fast',
        'Repeat spray every 14 days until conditions become unfavourable for rust',
        'Apply at the flag leaf stage to protect the most critical yield-forming leaf',
        'Do NOT delay treatment; yellow rust spreads faster than brown rust',
      ],
      prevention: [
        'Plant yellow-rust-resistant varieties recommended for your region',
        'Monitor weather forecasts; spray preventively during cool, wet spring spells',
        'Avoid late-season high-nitrogen topdressing that produces soft, susceptible tissue',
        'Report new rust outbreaks to local agricultural extension for regional early warnings',
      ],
    ),
  };
}

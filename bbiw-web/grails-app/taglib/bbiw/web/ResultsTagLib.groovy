package bbiw.web

class ResultsTagLib {
    static defaultEncodeAs = [taglib:'raw']

    def images = [
        'Research and Innovative Technology Administration': 'DepartmentOfTransportation.png',
        'EnvironmentalProtectionAgency': 'EnvironmentalProtectionAgency.svg',
        'BJS - Bureau of Justice Statistics': 'DepartmentOfJustice.png',
        'Office of the Secretary of Transportation': 'DepartmentOfTransportation.png',
        'Centers for Medicare & Medicaid Services': 'HealthData.png',
        'Federal Aviation Administration': 'DepartmentOfTransportation.png',
        'Federal Highway Administration': 'DepartmentOfTransportation.png',
        'Department of Defense': 'DepartmentOfDefense.jpg',
        'National Renewable Energy Laboratory (NREL)': 'DepartmentOfEnergy.jpeg',
        'U.S. Energy Information Administration (EIA)': 'DepartmentOfEnergy.jpeg',
        'DEA-Drug Enforcement Agency': 'DepartmentOfJustice.png',
        'National Highway Traffic Safety Administration': 'DepartmentOfTransportation.png',
        'U.S. Energy Information Administration': 'DepartmentOfEnergy.jpeg',
        'Pipeline and Hazardous Materials Safety Administration': 'DepartmentOfTransportation.png',
        'U.S. Food and Drug Administration': 'HealthData.png',
        'Federal Motor Carrier Safety Administration': 'DepartmentOfTransportation.png',
        'Office of Energy Efficiency & Renewable Energy (EERE)': 'DepartmentOfEnergy.jpeg',
        'Centers for Disease Control and Prevention': 'HealthData.png',
        'CRT - Civil Rights Division': 'DepartmentOfJustice.png',
        'data.cdc.gov': 'HealthData.png',
        'Administration for Children and Families': 'HealthData.png',
        'National Library of Medicine': 'HealthData.png',
        'University of Nevada Reno': 'DepartmentOfEnergy.jpeg',
        'Maritime Administration': 'DepartmentOfTransportation.png',
        'Surface Transportation Board': 'DepartmentOfTransportation.png',
        'DOE': 'DepartmentOfEnergy.jpeg',
        'Department of Health & Human Services': 'HealthData.png',
        'Inter-university Consortium for Political and Social Research': 'DepartmentOfJustice.png',
        'US Environmental Protection Agency': 'EnvironmentalProtectionAgency.svg',
        'Federal Railroad Administration': 'DepartmentOfTransportation.png',
        'Defense Logistics Agency': 'DepartmentOfDefense.jpg',
        'Agency for Healthcare Research and Quality': 'HealthData.png',
        'Sandia National Laboratories': 'DepartmentOfEnergy.jpeg',
        'DOE/Energy Information Administration': 'DepartmentOfEnergy.jpeg',
        'DOE Office of Scientific and Technical Information': 'DepartmentOfEnergy.jpeg',
        'ElectraTherm, Inc.': 'DepartmentOfEnergy.jpeg',
        'OJJDP - Office of Juvenile Justice and Delinquency Prevention': 'DepartmentOfJustice.png',
        'Health Resources and Services Administration': 'HealthData.png',
        'Lawrence Livermore National Laboratory': 'DepartmentOfEnergy.jpeg',
        'Federal Transit Administration': 'DepartmentOfTransportation.png',
        'Oak Ridge National Laboratory': 'DepartmentOfEnergy.jpeg',
        'USTP - U.S. Trustee Program': 'DepartmentOfJustice.png',
        'ATF - Bureau of Alcohol, Tobacco, Firearms and Explosives': 'DepartmentOfJustice.png',
        'U.S. Department of Energy (DOE)': 'DepartmentOfEnergy.jpeg',
        'DOE National Renewable Energy Laboratory': 'DepartmentOfEnergy.jpeg',
        'National Nuclear Security Administration': 'DepartmentOfEnergy.jpeg',
        'Defense Logistics Agency': 'DepartmentOfDefense.png',
        'Saint Lawrence Seaway Development Corporation': 'DepartmentOfTransportation.png',
        'Substance Abuse & Mental Health Services Administration': 'HealthData.png',
        'Terra-Gen Sierra Holdings, LLC': 'DepartmentOfEnergy.jpeg',
        'Oski Energy LLC': 'DepartmentOfEnergy.jpeg'
    ]

    def default_images = [
        'Energy': 'DepartmentOfEnergy.jpeg',
        'Crime': 'DepartmentOfJustice.png',
        'Environment': 'EnvironmentalProtectionAgency.svg',
        'Defense': 'DepartmentOfDefense.jpg',
        'Health': 'HealthData.png',
        'Transportation': 'DepartmentOfTransportation.png'
    ].withDefault { 'justice.png' }

    def resultImage = { attrs, body ->
        def image = images[attrs.publisher]
        if(!image)
            image = default_images[attrs.category[-1]]

        out << '<img src="'
        out << g.resource(dir:'images', file:image)
        out << "\" alt=\"${attrs.publisher}\" />"
    }
}

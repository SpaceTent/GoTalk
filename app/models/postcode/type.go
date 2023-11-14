package postcode

import (
	l "log/slog"
	"time"

	db "github.com/SpaceTent/db/mysql"

	"github.com/SpaceTent/GoTalk/pkg/metrics"
)

type Postcode struct {
	ID                         int    `db:"column=id primarykey=yes table=postcodes_all"`
	Code                       string `db:"column=postcode"`
	InUse                      string `db:"column=in_use"`
	Easting                    int    `db:"column=easting"`
	Northing                   int    `db:"column=northing"`
	GridRef                    string `db:"column=grid_ref"`
	County                     string `db:"column=county"`
	District                   string `db:"column=district"`
	Ward                       string `db:"column=ward"`
	DistrictCode               string `db:"column=district_code"`
	WardCode                   string `db:"column=ward_code"`
	Country                    string `db:"column=country"`
	CountyCode                 string `db:"column=county_code"`
	Constituency               string `db:"column=constituency"`
	Introduced                 string `db:"column=introduced"`
	Terminated                 string `db:"column=terminated"`
	Parish                     string `db:"column=parish"`
	NationalPark               string `db:"column=national_park"`
	Population                 string `db:"column=population"`
	Households                 string `db:"column=households"`
	BuiltUpArea                string `db:"column=built_up_area"`
	BuiltUpSubDivision         string `db:"column=built_up_sub_division"`
	LowerLayerSuperOutputArea  string `db:"column=lower_layer_super_output_area"`
	RuralUrban                 string `db:"column=rural_urban"`
	Region                     string `db:"column=region"`
	Altitude                   int    `db:"column=altitude"`
	LondonZone                 string `db:"column=london_zone"`
	LsoaCode                   string `db:"column=lsoa_code"`
	LocalAuthority             string `db:"column=local_authority"`
	MsoaCode                   string `db:"column=msoa_code"`
	MiddleLayerSuperOutputArea string `db:"column=middle_layer_super_output_area"`
	ParishCode                 string `db:"column=parish_code"`
	CensusOutputArea           string `db:"column=census_output_area"`
	ConstituencyCode           string `db:"column=constituency_code"`
	IndexOfMultipleDeprivation int    `db:"column=index_of_multiple_deprivation"`
	Quality                    int    `db:"column=quality"`
	UserType                   int    `db:"column=user_type"`
	LastUpdated                string `db:"column=last_updated"`
	NearestStation             string `db:"column=nearest_station"`
	PostcodeArea               string `db:"column=postcode_area"`
	PostcodeDistrict           string `db:"column=postcode_district"`
	PoliceForce                string `db:"column=police_force"`
	WaterCompany               string `db:"column=water_company"`
	PlusCode                   string `db:"column=plus_code"`
	AverageIncome              string `db:"column=average_income"`
	SewageCompany              string `db:"column=sewage_company"`
}

var SearchFields = "postcode,ward,district,constituency"

// Search is a function that retrieves a list of Postcode records.
func Search(search string, page int, limit int) ([]Postcode, error) {

	tnow := time.Now()
	defer metrics.Log("Postcode", "Get", tnow)

	out := []Postcode{}
	err := error(nil)

	if search != "" {
		l.With("Search", search)
		sql := "SELECT * FROM postcodes_all WHERE CONCAT(" + SearchFields + ") LIKE CONCAT( '%',?,'%')  ORDER BY id ASC LIMIT ?,?"
		// l.With("sql", sql).Debug("SQL")

		out, err = db.QueryStruct[Postcode](sql, search, page, limit)
		if err != nil {
			l.With("error", err).Error("Error getting Postcodes")
			metrics.LogError("Postcode", "Get", err)
			return out, err
		}
	} else {
		sql := "SELECT * FROM postcodes_all ORDER BY id ASC LIMIT ?,?"
		out, err = db.QueryStruct[Postcode](sql, page, limit)
		if err != nil {
			l.With("error", err).Error("Error getting Postcodes")
			metrics.LogError("Postcode", "Get", err)
			return out, err
		}
	}

	return out, nil
}

// GetTotalRecords is a function that retrieves the total number of Postcode records.
// It takes a string search as an argument and returns an integer.
func GetTotalRecords(search string) int {

	tnow := time.Now()
	defer metrics.Log("Postcode", "GetTotalRecords", tnow)

	out := 0
	R := []db.Record{}
	err := error(nil)

	if search != "" {
		sql := "SELECT count(*) as C FROM postcodes_all WHERE CONCAT(" + SearchFields + ") LIKE CONCAT( '%',?,'%')"
		R, err = db.DB.Query(sql, search)
		if err != nil {
			l.With("error", err).Error("Error getting GetTotalRecords")
			metrics.LogError("Postcode", "GetTotalRecords", err)
			return 0
		}

	} else {
		sql := "SELECT count(*) as C FROM postcodes_all"
		R, err = db.DB.Query(sql)
		if err != nil {
			l.With("error", err).Error("Error getting GetTotalRecords")
			metrics.LogError("Postcode", "GetTotalRecords", err)
			return 0
		}
	}

	if len(R) > 0 {
		out = R[0]["C"].AsInt()
	}
	return out
}

// GetByID is a function that retrieves a Postcode record by its ID.
// It takes an integer id as an argument and returns a Postcode struct.
func GetByID(id int) Postcode {

	out := Postcode{}
	if id == 0 {
		return out
	}

	sql := "SELECT * FROM postcodes_all WHERE id = ? LIMIT 1;"
	out, err := db.QuerySingleStruct[Postcode](sql, id)
	if err != nil {
		l.With("error", err).Error("Error getting GetByID")
		metrics.LogError("Postcode", "GetByID", err)
	}

	return out
}

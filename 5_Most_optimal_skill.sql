-- find the highest in demand skills
-- find highest paying jobs required skills
WITH in_demand_table AS
    (SELECT 
        COUNT(job_postings_fact.job_id) AS count,
        --job_title_short,
        --salary_year_avg,
        skills_dim.skills AS indemand_table_skills

    FROM 
        job_postings_fact

    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id

    GROUP BY indemand_table_skills
    ), 
    highest_salary AS ( 
    SELECT 
        skills_dim.skills AS highest_salary_skills,
        ROUND(AVG(salary_year_avg), 0) AS salary_avg
        
    FROM 
        job_postings_fact

    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
    salary_year_avg IS NOT NULL

    GROUP BY highest_salary_skills
)

SELECT 
    indemand_table_skills,
    count,
    highest_salary.salary_avg




FROM in_demand_table

INNER JOIN highest_salary ON in_demand_table.indemand_table_skills = highest_salary.highest_salary_skills

ORDER BY count DESC

    


/*
Insights:
Shows which skills combine high demand and high pay.

Helps identify skills that are lucrative and frequently requested*/

/*
[
  {
    "indemand_table_skills": "debian",
    "count": "301",
    "salary_avg": "196500"
  },
  {
    "indemand_table_skills": "ringcentral",
    "count": "105",
    "salary_avg": "182500"
  },
  {
    "indemand_table_skills": "mongo",
    "count": "4471",
    "salary_avg": "170715"
  },
  {
    "indemand_table_skills": "lua",
    "count": "187",
    "salary_avg": "170500"
  },
  {
    "indemand_table_skills": "dplyr",
    "count": "669",
    "salary_avg": "160667"
  },
  {
    "indemand_table_skills": "haskell",
    "count": "252",
    "salary_avg": "155758"
  },
  {
    "indemand_table_skills": "asp.net core",
    "count": "184",
    "salary_avg": "155000"
  },
  {
    "indemand_table_skills": "node",
    "count": "2002",
    "salary_avg": "154408"
  },
  {
    "indemand_table_skills": "cassandra",
    "count": "12471",
    "salary_avg": "154124"
  },
  {
    "indemand_table_skills": "solidity",
    "count": "440",
    "salary_avg": "153640"
  },
  {
    "indemand_table_skills": "watson",
    "count": "947",
    "salary_avg": "152844"
  },
  {
    "indemand_table_skills": "codecommit",
    "count": "250",
    "salary_avg": "152289"
  },
  {
    "indemand_table_skills": "rshiny",
    "count": "777",
    "salary_avg": "151611"
  },
  {
    "indemand_table_skills": "hugging face",
    "count": "986",
    "salary_avg": "148648"
  },
  {
    "indemand_table_skills": "neo4j",
    "count": "3755",
    "salary_avg": "147708"
  },
  {
    "indemand_table_skills": "gatsby",
    "count": "34",
    "salary_avg": "147500"
  },
  {
    "indemand_table_skills": "scala",
    "count": "57058",
    "salary_avg": "145120"
  },
  {
    "indemand_table_skills": "mlr",
    "count": "112",
    "salary_avg": "145000"
  },
  {
    "indemand_table_skills": "kafka",
    "count": "50092",
    "salary_avg": "144754"
  },
  {
    "indemand_table_skills": "pytorch",
    "count": "27325",
    "salary_avg": "144470"
  },
  {
    "indemand_table_skills": "couchdb",
    "count": "215",
    "salary_avg": "144167"
  },
  {
    "indemand_table_skills": "mxnet",
    "count": "1149",
    "salary_avg": "143695"
  },
  {
    "indemand_table_skills": "theano",
    "count": "878",
    "salary_avg": "143404"
  },
  {
    "indemand_table_skills": "shell",
    "count": "18670",
    "salary_avg": "143370"
  },
  {
    "indemand_table_skills": "golang",
    "count": "4189",
    "salary_avg": "143139"
  },
  {
    "indemand_table_skills": "airflow",
    "count": "45363",
    "salary_avg": "142386"
  },
  {
    "indemand_table_skills": "tensorflow",
    "count": "33270",
    "salary_avg": "142370"
  },
  {
    "indemand_table_skills": "spark",
    "count": "114928",
    "salary_avg": "141734"
  },
  {
    "indemand_table_skills": "heroku",
    "count": "211",
    "salary_avg": "141667"
  },
  {
    "indemand_table_skills": "redshift",
    "count": "33513",
    "salary_avg": "140792"
  },
  {
    "indemand_table_skills": "airtable",
    "count": "295",
    "salary_avg": "140615"
  },
  {
    "indemand_table_skills": "ruby on rails",
    "count": "617",
    "salary_avg": "140130"
  },
  {
    "indemand_table_skills": "scikit-learn",
    "count": "20097",
    "salary_avg": "139603"
  },
  {
    "indemand_table_skills": "dynamodb",
    "count": "7004",
    "salary_avg": "139548"
  },
  {
    "indemand_table_skills": "rust",
    "count": "1959",
    "salary_avg": "139349"
  },
  {
    "indemand_table_skills": "clojure",
    "count": "295",
    "salary_avg": "139342"
  },
  {
    "indemand_table_skills": "redis",
    "count": "5730",
    "salary_avg": "139213"
  },
  {
    "indemand_table_skills": "atlassian",
    "count": "2383",
    "salary_avg": "138651"
  },
  {
    "indemand_table_skills": "hadoop",
    "count": "65041",
    "salary_avg": "138574"
  },
  {
    "indemand_table_skills": "snowflake",
    "count": "55150",
    "salary_avg": "137960"
  },
  {
    "indemand_table_skills": "kubernetes",
    "count": "37436",
    "salary_avg": "137949"
  },
  {
    "indemand_table_skills": "pandas",
    "count": "32261",
    "salary_avg": "137518"
  },
  {
    "indemand_table_skills": "openstack",
    "count": "791",
    "salary_avg": "137455"
  },
  {
    "indemand_table_skills": "nosql",
    "count": "45227",
    "salary_avg": "137039"
  },
  {
    "indemand_table_skills": "numpy",
    "count": "20491",
    "salary_avg": "136809"
  },
  {
    "indemand_table_skills": "fastapi",
    "count": "2237",
    "salary_avg": "136574"
  },
  {
    "indemand_table_skills": "aws",
    "count": "145718",
    "salary_avg": "136481"
  },
  {
    "indemand_table_skills": "java",
    "count": "85854",
    "salary_avg": "136210"
  },
  {
    "indemand_table_skills": "keras",
    "count": "12401",
    "salary_avg": "136026"
  },
  {
    "indemand_table_skills": "c",
    "count": "15736",
    "salary_avg": "135987"
  },
  {
    "indemand_table_skills": "splunk",
    "count": "5118",
    "salary_avg": "135746"
  },
  {
    "indemand_table_skills": "next.js",
    "count": "209",
    "salary_avg": "135663"
  },
  {
    "indemand_table_skills": "kotlin",
    "count": "2375",
    "salary_avg": "135639"
  },
  {
    "indemand_table_skills": "seaborn",
    "count": "3752",
    "salary_avg": "135501"
  },
  {
    "indemand_table_skills": "mysql",
    "count": "25644",
    "salary_avg": "135432"
  },
  {
    "indemand_table_skills": "pyspark",
    "count": "32279",
    "salary_avg": "135011"
  },
  {
    "indemand_table_skills": "perl",
    "count": "4726",
    "salary_avg": "134374"
  },
  {
    "indemand_table_skills": "jupyter",
    "count": "9432",
    "salary_avg": "133829"
  },
  {
    "indemand_table_skills": "c++",
    "count": "21466",
    "salary_avg": "133733"
  },
  {
    "indemand_table_skills": "bigquery",
    "count": "24113",
    "salary_avg": "133649"
  },
  {
    "indemand_table_skills": "no-sql",
    "count": "2851",
    "salary_avg": "133556"
  },
  {
    "indemand_table_skills": "terraform",
    "count": "20452",
    "salary_avg": "133161"
  },
  {
    "indemand_table_skills": "fastify",
    "count": "26",
    "salary_avg": "133000"
  },
  {
    "indemand_table_skills": "elasticsearch",
    "count": "9975",
    "salary_avg": "132742"
  },
  {
    "indemand_table_skills": "asana",
    "count": "556",
    "salary_avg": "132697"
  },
  {
    "indemand_table_skills": "matplotlib",
    "count": "8918",
    "salary_avg": "132508"
  },
  {
    "indemand_table_skills": "python",
    "count": "381863",
    "salary_avg": "132440"
  },
  {
    "indemand_table_skills": "arch",
    "count": "279",
    "salary_avg": "132376"
  },
  {
    "indemand_table_skills": "datarobot",
    "count": "806",
    "salary_avg": "132211"
  },
  {
    "indemand_table_skills": "typescript",
    "count": "5145",
    "salary_avg": "132149"
  },
  {
    "indemand_table_skills": "docker",
    "count": "41834",
    "salary_avg": "132040"
  },
  {
    "indemand_table_skills": "flask",
    "count": "4814",
    "salary_avg": "131959"
  },
  {
    "indemand_table_skills": "couchbase",
    "count": "641",
    "salary_avg": "131959"
  },
  {
    "indemand_table_skills": "objective-c",
    "count": "160",
    "salary_avg": "131825"
  },
  {
    "indemand_table_skills": "gcp",
    "count": "50824",
    "salary_avg": "131738"
  },
  {
    "indemand_table_skills": "go",
    "count": "38752",
    "salary_avg": "131689"
  },
  {
    "indemand_table_skills": "plotly",
    "count": "4208",
    "salary_avg": "131610"
  },
  {
    "indemand_table_skills": "databricks",
    "count": "53282",
    "salary_avg": "131525"
  },
  {
    "indemand_table_skills": "aurora",
    "count": "3204",
    "salary_avg": "131308"
  },
  {
    "indemand_table_skills": "mongodb",
    "count": "36436",
    "salary_avg": "131207"
  },
  {
    "indemand_table_skills": "express",
    "count": "7429",
    "salary_avg": "131088"
  },
  {
    "indemand_table_skills": "ruby",
    "count": "8812",
    "salary_avg": "130712"
  },
  {
    "indemand_table_skills": "azure",
    "count": "132851",
    "salary_avg": "130433"
  },
  {
    "indemand_table_skills": "gitlab",
    "count": "9470",
    "salary_avg": "130257"
  },
  {
    "indemand_table_skills": "gdpr",
    "count": "7099",
    "salary_avg": "130194"
  },
  {
    "indemand_table_skills": "vue",
    "count": "2955",
    "salary_avg": "129863"
  },
  {
    "indemand_table_skills": "nltk",
    "count": "2489",
    "salary_avg": "129738"
  },
  {
    "indemand_table_skills": "svn",
    "count": "1202",
    "salary_avg": "129287"
  },
  {
    "indemand_table_skills": "tidyverse",
    "count": "874",
    "salary_avg": "129103"
  },
  {
    "indemand_table_skills": "looker",
    "count": "20010",
    "salary_avg": "129006"
  },
  {
    "indemand_table_skills": "jenkins",
    "count": "19839",
    "salary_avg": "128872"
  },
  {
    "indemand_table_skills": "graphql",
    "count": "2683",
    "salary_avg": "128659"
  },
  {
    "indemand_table_skills": "linux",
    "count": "30795",
    "salary_avg": "128614"
  },
  {
    "indemand_table_skills": "django",
    "count": "4018",
    "salary_avg": "128528"
  },
  {
    "indemand_table_skills": "zoom",
    "count": "1894",
    "salary_avg": "128427"
  },
  {
    "indemand_table_skills": "julia",
    "count": "2473",
    "salary_avg": "128319"
  },
  {
    "indemand_table_skills": "git",
    "count": "50358",
    "salary_avg": "128316"
  },
  {
    "indemand_table_skills": "ibm cloud",
    "count": "1697",
    "salary_avg": "127753"
  },
  {
    "indemand_table_skills": "ubuntu",
    "count": "1243",
    "salary_avg": "127649"
  },
  {
    "indemand_table_skills": "r",
    "count": "131285",
    "salary_avg": "127115"
  },
  {
    "indemand_table_skills": "angular.js",
    "count": "115",
    "salary_avg": "127050"
  },
  {
    "indemand_table_skills": "opencv",
    "count": "2196",
    "salary_avg": "127034"
  },
  {
    "indemand_table_skills": "notion",
    "count": "1808",
    "salary_avg": "127007"
  },
  {
    "indemand_table_skills": "ggplot2",
    "count": "1291",
    "salary_avg": "126630"
  },
  {
    "indemand_table_skills": "unity",
    "count": "1694",
    "salary_avg": "126608"
  },
  {
    "indemand_table_skills": "postgresql",
    "count": "20744",
    "salary_avg": "126401"
  },
  {
    "indemand_table_skills": "bitbucket",
    "count": "5056",
    "salary_avg": "126316"
  },
  {
    "indemand_table_skills": "chef",
    "count": "3714",
    "salary_avg": "126314"
  },
  {
    "indemand_table_skills": "twilio",
    "count": "249",
    "salary_avg": "126210"
  },
  {
    "indemand_table_skills": "node.js",
    "count": "3070",
    "salary_avg": "126156"
  },
  {
    "indemand_table_skills": "centos",
    "count": "662",
    "salary_avg": "125953"
  },
  {
    "indemand_table_skills": "angular",
    "count": "5366",
    "salary_avg": "125600"
  },
  {
    "indemand_table_skills": "suse",
    "count": "120",
    "salary_avg": "125000"
  },
  {
    "indemand_table_skills": "ansible",
    "count": "7907",
    "salary_avg": "124991"
  },
  {
    "indemand_table_skills": "sqlite",
    "count": "368",
    "salary_avg": "124976"
  },
  {
    "indemand_table_skills": "sql",
    "count": "385750",
    "salary_avg": "124935"
  },
  {
    "indemand_table_skills": "github",
    "count": "19997",
    "salary_avg": "124816"
  },
  {
    "indemand_table_skills": "vmware",
    "count": "2781",
    "salary_avg": "124486"
  },
  {
    "indemand_table_skills": "jira",
    "count": "23546",
    "salary_avg": "124154"
  },
  {
    "indemand_table_skills": "php",
    "count": "4376",
    "salary_avg": "123898"
  },
  {
    "indemand_table_skills": "bash",
    "count": "9922",
    "salary_avg": "123893"
  },
  {
    "indemand_table_skills": "react",
    "count": "9237",
    "salary_avg": "123799"
  },
  {
    "indemand_table_skills": "confluence",
    "count": "10775",
    "salary_avg": "123223"
  },
  {
    "indemand_table_skills": "phoenix",
    "count": "1782",
    "salary_avg": "122996"
  },
  {
    "indemand_table_skills": "puppet",
    "count": "1727",
    "salary_avg": "122649"
  },
  {
    "indemand_table_skills": "c#",
    "count": "16842",
    "salary_avg": "122307"
  },
  {
    "indemand_table_skills": "unix",
    "count": "11719",
    "salary_avg": "122118"
  },
  {
    "indemand_table_skills": "matlab",
    "count": "11940",
    "salary_avg": "122048"
  },
  {
    "indemand_table_skills": "erlang",
    "count": "136",
    "salary_avg": "121583"
  },
  {
    "indemand_table_skills": "redhat",
    "count": "871",
    "salary_avg": "121467"
  },
  {
    "indemand_table_skills": "xamarin",
    "count": "62",
    "salary_avg": "121250"
  },
  {
    "indemand_table_skills": "unify",
    "count": "1310",
    "salary_avg": "120251"
  },
  {
    "indemand_table_skills": "flow",
    "count": "32029",
    "salary_avg": "120211"
  },
  {
    "indemand_table_skills": "slack",
    "count": "2589",
    "salary_avg": "120118"
  },
  {
    "indemand_table_skills": "swift",
    "count": "1893",
    "salary_avg": "119972"
  },
  {
    "indemand_table_skills": "selenium",
    "count": "2296",
    "salary_avg": "119914"
  },
  {
    "indemand_table_skills": "db2",
    "count": "4506",
    "salary_avg": "119824"
  },
  {
    "indemand_table_skills": "microstrategy",
    "count": "5318",
    "salary_avg": "119563"
  },
  {
    "indemand_table_skills": "spring",
    "count": "7239",
    "salary_avg": "119397"
  },
  {
    "indemand_table_skills": "mariadb",
    "count": "1138",
    "salary_avg": "119354"
  },
  {
    "indemand_table_skills": "groovy",
    "count": "1022",
    "salary_avg": "119251"
  },
  {
    "indemand_table_skills": "cordova",
    "count": "132",
    "salary_avg": "117921"
  },
  {
    "indemand_table_skills": "powershell",
    "count": "7159",
    "salary_avg": "116803"
  },
  {
    "indemand_table_skills": "tableau",
    "count": "127500",
    "salary_avg": "116796"
  },
  {
    "indemand_table_skills": "oracle",
    "count": "45318",
    "salary_avg": "115125"
  },
  {
    "indemand_table_skills": "qlik",
    "count": "16960",
    "salary_avg": "115040"
  },
  {
    "indemand_table_skills": "javascript",
    "count": "25286",
    "salary_avg": "114837"
  },
  {
    "indemand_table_skills": "electron",
    "count": "231",
    "salary_avg": "114678"
  },
  {
    "indemand_table_skills": "jquery",
    "count": "1505",
    "salary_avg": "114645"
  },
  {
    "indemand_table_skills": "react.js",
    "count": "654",
    "salary_avg": "114450"
  },
  {
    "indemand_table_skills": "css",
    "count": "5782",
    "salary_avg": "113897"
  },
  {
    "indemand_table_skills": "assembly",
    "count": "1927",
    "salary_avg": "113119"
  },
  {
    "indemand_table_skills": "alteryx",
    "count": "12323",
    "salary_avg": "112907"
  },
  {
    "indemand_table_skills": "sas",
    "count": "83652",
    "salary_avg": "112788"
  },
  {
    "indemand_table_skills": "unreal",
    "count": "285",
    "salary_avg": "112667"
  },
  {
    "indemand_table_skills": "sql server",
    "count": "40287",
    "salary_avg": "112487"
  },
  {
    "indemand_table_skills": "t-sql",
    "count": "8780",
    "salary_avg": "112403"
  },
  {
    "indemand_table_skills": "ssis",
    "count": "18853",
    "salary_avg": "112265"
  },
  {
    "indemand_table_skills": "elixir",
    "count": "311",
    "salary_avg": "112073"
  },
  {
    "indemand_table_skills": "yarn",
    "count": "2175",
    "salary_avg": "111963"
  },
  {
    "indemand_table_skills": "pulumi",
    "count": "456",
    "salary_avg": "111772"
  },
  {
    "indemand_table_skills": "terminal",
    "count": "1682",
    "salary_avg": "111582"
  },
  {
    "indemand_table_skills": "asp.net",
    "count": "1230",
    "salary_avg": "110963"
  },
  {
    "indemand_table_skills": "fortran",
    "count": "285",
    "salary_avg": "110083"
  },
  {
    "indemand_table_skills": "qt",
    "count": "154",
    "salary_avg": "110000"
  },
  {
    "indemand_table_skills": "windows",
    "count": "13329",
    "salary_avg": "109718"
  },
  {
    "indemand_table_skills": "html",
    "count": "7874",
    "salary_avg": "109678"
  },
  {
    "indemand_table_skills": "sass",
    "count": "363",
    "salary_avg": "109585"
  },
  {
    "indemand_table_skills": "dax",
    "count": "9275",
    "salary_avg": "109408"
  },
  {
    "indemand_table_skills": "firebase",
    "count": "2220",
    "salary_avg": "109095"
  },
  {
    "indemand_table_skills": "sap",
    "count": "29181",
    "salary_avg": "108103"
  },
  {
    "indemand_table_skills": "power bi",
    "count": "98363",
    "salary_avg": "106738"
  },
  {
    "indemand_table_skills": "cobol",
    "count": "358",
    "salary_avg": "106497"
  },
  {
    "indemand_table_skills": "macos",
    "count": "796",
    "salary_avg": "105771"
  },
  {
    "indemand_table_skills": "dart",
    "count": "247",
    "salary_avg": "105373"
  },
  {
    "indemand_table_skills": "drupal",
    "count": "199",
    "salary_avg": "105234"
  },
  {
    "indemand_table_skills": "chainer",
    "count": "13",
    "salary_avg": "105000"
  },
  {
    "indemand_table_skills": "clickup",
    "count": "132",
    "salary_avg": "105000"
  },
  {
    "indemand_table_skills": "vue.js",
    "count": "620",
    "salary_avg": "104958"
  },
  {
    "indemand_table_skills": "lisp",
    "count": "75",
    "salary_avg": "104124"
  },
  {
    "indemand_table_skills": "visio",
    "count": "5318",
    "salary_avg": "103749"
  },
  {
    "indemand_table_skills": "ssrs",
    "count": "9291",
    "salary_avg": "103189"
  },
  {
    "indemand_table_skills": "spss",
    "count": "10368",
    "salary_avg": "102627"
  },
  {
    "indemand_table_skills": "vba",
    "count": "12743",
    "salary_avg": "101846"
  },
  {
    "indemand_table_skills": "cognos",
    "count": "5432",
    "salary_avg": "101469"
  },
  {
    "indemand_table_skills": "wrike",
    "count": "73",
    "salary_avg": "101250"
  },
  {
    "indemand_table_skills": "wire",
    "count": "466",
    "salary_avg": "100704"
  },
  {
    "indemand_table_skills": "crystal",
    "count": "2491",
    "salary_avg": "99942"
  },
  {
    "indemand_table_skills": "excel",
    "count": "127341",
    "salary_avg": "99751"
  },
  {
    "indemand_table_skills": "powerpoint",
    "count": "28617",
    "salary_avg": "99160"
  },
  {
    "indemand_table_skills": "word",
    "count": "30645",
    "salary_avg": "99012"
  },
  {
    "indemand_table_skills": "sharepoint",
    "count": "8795",
    "salary_avg": "98611"
  },
  {
    "indemand_table_skills": "visual basic",
    "count": "2218",
    "salary_avg": "98511"
  },
  {
    "indemand_table_skills": "delphi",
    "count": "90",
    "salary_avg": "98496"
  },
  {
    "indemand_table_skills": "symphony",
    "count": "290",
    "salary_avg": "98400"
  },
  {
    "indemand_table_skills": "workfront",
    "count": "81",
    "salary_avg": "97841"
  },
  {
    "indemand_table_skills": "npm",
    "count": "429",
    "salary_avg": "97030"
  },
  {
    "indemand_table_skills": "homebrew",
    "count": "14",
    "salary_avg": "96773"
  },
  {
    "indemand_table_skills": "svelte",
    "count": "105",
    "salary_avg": "94575"
  },
  {
    "indemand_table_skills": "sheets",
    "count": "5598",
    "salary_avg": "94455"
  },
  {
    "indemand_table_skills": "spreadsheet",
    "count": "3664",
    "salary_avg": "93746"
  },
  {
    "indemand_table_skills": "microsoft teams",
    "count": "741",
    "salary_avg": "93559"
  },
  {
    "indemand_table_skills": "outlook",
    "count": "8992",
    "salary_avg": "93220"
  },
  {
    "indemand_table_skills": "colocation",
    "count": "368",
    "salary_avg": "92943"
  },
  {
    "indemand_table_skills": "trello",
    "count": "570",
    "salary_avg": "92643"
  },
  {
    "indemand_table_skills": "ms access",
    "count": "2888",
    "salary_avg": "92341"
  },
  {
    "indemand_table_skills": "pascal",
    "count": "68",
    "salary_avg": "92000"
  },
  {
    "indemand_table_skills": "apl",
    "count": "199",
    "salary_avg": "90000"
  },
  {
    "indemand_table_skills": "kali",
    "count": "17",
    "salary_avg": "89100"
  },
  {
    "indemand_table_skills": "webex",
    "count": "236",
    "salary_avg": "88750"
  },
  {
    "indemand_table_skills": "flutter",
    "count": "491",
    "salary_avg": "87702"
  },
  {
    "indemand_table_skills": "vb.net",
    "count": "482",
    "salary_avg": "87226"
  },
  {
    "indemand_table_skills": "planner",
    "count": "1033",
    "salary_avg": "83420"
  },
  {
    "indemand_table_skills": "laravel",
    "count": "343",
    "salary_avg": "82200"
  },
  {
    "indemand_table_skills": "smartsheet",
    "count": "642",
    "salary_avg": "81049"
  },
  {
    "indemand_table_skills": "firestore",
    "count": "334",
    "salary_avg": "80019"
  },
  {
    "indemand_table_skills": "monday.com",
    "count": "176",
    "salary_avg": "77880"
  },
  {
    "indemand_table_skills": "blazor",
    "count": "68",
    "salary_avg": "74733"
  },
  {
    "indemand_table_skills": "digitalocean",
    "count": "275",
    "salary_avg": "65000"
  }
]*/
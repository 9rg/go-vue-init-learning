package main

import (
	"github.com/gin-contrib/cors"
  "github.com/gin-gonic/gin"
  "database/sql"	
  _ "github.com/denisenkom/go-mssqldb"
	"log"
	"net/http"
)

func main() {
	r := gin.Default()

  // CORSミドルウェアを追加
  r.Use(cors.New(cors.Config{
    AllowOrigins: []string{"http://localhost:8081"}, // フロントエンドのURL
    AllowMethods: []string{"GET", "POST", "PUT", "DELETE"}, // 許可するHTTPメソッド
    AllowHeaders: []string{"Origin", "Content-Type", "Authorization"}, // 許可するヘッダー
  }))


	// DB接続
	connString := "server=mssql;user id=9rg;password=${DB_PASSWORD};database=mydb"
	conn, err := sql.Open("sqlserver", connString)
	if err != nil {
		log.Fatal("Error opening connection: ", err.Error())
	}

	defer conn.Close()

	// APIエンドポイント
	r.GET("/users", func(c *gin.Context) {
    // TODO:何らかの DB 関連処理を書く 
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello, world!",
		})
	})

	// サーバーの開始
	r.Run(":8080")
}

package controller

import (
    l "log/slog"
    "math/rand"
    "net/http"
    "strconv"
    "time"
    
    "github.com/go-chi/chi"
    
    "github.com/SpaceTent/GoTalk/app/environment"
    "github.com/SpaceTent/GoTalk/app/models/postcode"
    "github.com/SpaceTent/GoTalk/pkg/metrics"
    "github.com/SpaceTent/GoTalk/pkg/web"
)

func Postcodes(w http.ResponseWriter, r *http.Request) {
    
    tnow := time.Now()
    defer metrics.Log("Controller", "Postcodes", tnow)
    
    PageSize := environment.GetEnvInt("PAGE_SIZE", 25)
    pageData := make(map[string]any)
    
    // You would definatelly santize the input here.
    Search := r.FormValue("Search")
    pageData["Search"] = Search
    
    CurrentPage, _ := strconv.Atoi(r.FormValue("CurrentPage"))
    pageData["CurrentPage"] = CurrentPage
    
    TotalRecords := postcode.GetTotalRecords(Search)
    
    params := r.URL.Query()
    TotalPages := TotalRecords / PageSize
    
    if params.Get("action") == "next" {
        CurrentPage++
        w.Header().Set("HX-Trigger", "newDog")
        if CurrentPage > TotalPages {
            CurrentPage = TotalPages
        }
    }
    
    if params.Get("action") == "previous" {
        CurrentPage--
        if CurrentPage < 0 {
            CurrentPage = 0
        }
    }
    
    // Display Starts at 1, db starts at 0
    pageData["Postcodes"], _ = postcode.Search(Search, CurrentPage*PageSize, PageSize)
    pageData["CurrentPage"] = CurrentPage
    pageData["DisplayPage"] = CurrentPage + 1
    pageData["TotalRecords"] = TotalRecords
    pageData["TotalPages"] = TotalPages
    pageData["DisplayTotal"] = TotalPages + 1
    
    l.With("TotalRecords", TotalRecords, "TotalPage", TotalPages, "CurrentPage", CurrentPage, "Search", Search).Info("Postcodes Search")
    
    if r.Method == "POST" {
        metrics.LogEventCounter("Postcode", "Render Table")
        web.Render(w, r, pageData, "postcodes-table.gohtml")
    } else {
        metrics.LogEventCounter("Postcode", "Render Full Page")
        web.Render(w, r, pageData, "postcodes-index.gohtml")
    }
}

func PostcodesView(w http.ResponseWriter, r *http.Request) {
    
    tnow := time.Now()
    defer metrics.Log("Controller", "PostcodesView", tnow)
    
    pageData := make(map[string]any)
    
    // You would definatelly santize the input here.
    ID, _ := strconv.Atoi(chi.URLParam(r, "id"))
    pageData["Postcode"] = postcode.GetByID(ID)
    
    web.Render(w, r, pageData, "postcodes-modal.gohtml")
}

func PostcodesDog(w http.ResponseWriter, r *http.Request) {
    
    tnow := time.Now()
    defer metrics.Log("Controller", "PostcodesDog", tnow)
    
    pageData := make(map[string]any)
    pageData["dogRand"] = 200 + rand.Intn(50)
    
    web.Render(w, r, pageData, "postcodes-dog.gohtml")
}

{ :user {:plugins [[cider/cider-nrepl "0.8.2"]
                   [lein-try "0.4.3"]
                   [com.jakemccrary/lein-test-refresh "0.7.0"]]
         :dependencies [[redl "0.2.2"]]
         :injections [(require '[redl core complete])]}}

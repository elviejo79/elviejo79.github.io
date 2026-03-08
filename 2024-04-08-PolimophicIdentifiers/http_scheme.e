
feature
    example_grdual_construction:like Current
            -- This is in example fo how I would use this class it should be used like test case
        local
            l_http:HTTP
            host = "www.example.com"
            folder = "folder"
            subfolder = "subfolder"
            file = "filename.extension"
            qry = "query_string=value&var2=value"
            anchor = "a heding in the document"
        do
            l_http := {HTTP}:// host / folder / subfolder / file ? qury # anchor

            check
                scheme_gets_created_statically: l_http /= void
                scheme_can_get_created_gradually: "http://www.example.com/folder/subfolder/filename?query_string#anchor" = l_http
                scheme_pretty_prints: "http://www.example.com/folder/subfolder/filename?query_string#anchor" = l_http
            end


            l_http := "http://www.example.com/folder/subfolder/filename?query_string#anchor"

            check
                an_scheme_can_be_created_by_string: "http://www.example.com/folder/subfolder/filename?query_string#anchor" = l_http
            end

            check
                can_we_ask_things_of_the_service: host = l_http.host
                what_is_the_path: folder = l_http.path
                what_is_the_file: file = l_http.file
            end
        end
    end


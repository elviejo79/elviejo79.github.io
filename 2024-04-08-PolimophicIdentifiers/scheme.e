deferred class SCHEME
    creation
        make
    feature -- creation

        make alias ":"
            -- schemes are supposde to be started statically
            do
                create Current
            end
    feture
end

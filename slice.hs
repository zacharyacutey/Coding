slice_ :: [a] -> Int -> Int -> [a];
slice_ [] _ _ = [];
slice_ xs k n 	| k == n = []
		| k > n || k > length xs || 
                  n > length xs || k < 0 || n < 0 = []
		| k == 0 = (take n xs)
		| otherwise = (drop (k-1) $ take n xs);
slice :: [a] -> Int -> Int -> [a];
slice xs k n = slice_ xs (k + 1) n;

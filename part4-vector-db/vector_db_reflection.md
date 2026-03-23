## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a law firm searching through large 500-page contracts. Keyword search relies on exact word matching, which means it may miss relevant information if the wording in the contract differs from the query. For example, a lawyer searching for “termination clauses” might miss sections labeled as “contract cancellation” or “agreement ending conditions,” even though they convey the same meaning.

In contrast, a vector database enables semantic search by understanding the meaning of the text rather than just matching keywords. Using embeddings, both the contract content and the user’s query are converted into numerical vectors that capture their contextual meaning. This allows the system to find relevant sections even if the exact words do not match.

In this system, the contracts would first be broken into smaller chunks (such as paragraphs or sections), and embeddings would be generated for each chunk. These embeddings would then be stored in a vector database. When a lawyer asks a question in plain English, the query is also converted into an embedding, and the system retrieves the most semantically similar chunks using similarity search.

If a fraud detection module is added, the importance of semantic understanding increases further. Vector databases can help identify patterns, anomalies, or suspicious clauses across documents, which may not be easily detectable through keyword-based approaches.

Therefore, a vector database is essential for building an efficient, intelligent, and scalable contract search system.


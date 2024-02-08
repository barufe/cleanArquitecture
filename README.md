# Casos de uso

## Mostrar listas de cryptomonedas globales

Como usuario, quiero poder consultar las crypto globales ordenadas por capitalizacion de mercado (Market cap)

GIVEN Tengo la app iniciada
WHEN accedo a la vista global
THEN veo un listado de crypto globales
AND información básica de cada crypto (nombre, simbolo, precio, cambio de precio últimas 24h, volumen últimas 24h, capitalización de mercado)

-Entities
    Cryptocurrency
        Id
        Name
        Symbol
        Price
        Price24
        Vulume24
        MarketCap
        
-Use cases
    Get Global List
    
    
    

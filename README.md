# Tłumacz PL → EN pod skrótem

> Windows tray app: type in Polish anywhere (WhatsApp, Teams, browser…), press
> **Ctrl+Alt+T** and the text is replaced with its English translation.
> Backends: DeepSeek (or any OpenAI-compatible LLM), Google Translate, DeepL.

Piszesz po polsku w dowolnym miejscu (WhatsApp, Teams, przeglądarka, Word…), wciskasz
**Ctrl+Alt+T** i tekst zamienia się na angielski.

- Jeśli coś **zaznaczysz**, przetłumaczy się tylko zaznaczenie.
- Jeśli nic nie jest zaznaczone, przetłumaczy się **całe pole tekstowe**.
- Podczas tłumaczenia ikona „EN” w zasobniku robi się pomarańczowa.
- Nie podoba Ci się wynik? **Ctrl+Z** cofa podmianę.

## Instalacja

Potrzebujesz Windowsa 10/11 i [Pythona 3.10+](https://www.python.org/downloads/)
(przy instalacji zaznacz „Add Python to PATH”).

```bash
git clone https://github.com/krapcys1-maker/tlumacz-pl-en.git
```

Albo pobierz ZIP: zielony przycisk **Code → Download ZIP**.

## Uruchomienie

Kliknij dwukrotnie `start.bat`. Przy pierwszym uruchomieniu zainstalują się biblioteki,
a z `config.example.json` powstanie Twój prywatny `config.json` (nie trafia do gita).
Program działa w tle; ikona „EN” pojawi się obok zegara (może być ukryta pod strzałką ^).
Kliknij ją prawym przyciskiem, żeby:

- wybrać silnik tłumaczenia,
- włączyć uruchamianie razem z Windows,
- otworzyć ustawienia,
- **wyłączyć program: „Zakończ”**.

## Silniki tłumaczenia

| Silnik | Jakość | Koszt | Klucz |
|---|---|---|---|
| **Google Translate** | dobra, czasem „sztywna” | darmowy (nieoficjalny) | niepotrzebny |
| **DeepL** | bardzo dobra | darmowe 500 tys. znaków/mies. | darmowe konto na deepl.com/pro-api |
| **DeepSeek (AI)** | najlepsza, naturalny ton, rozumie slang | grosze | platform.deepseek.com |

Domyślnie działa Google, więc program jest gotowy od razu. Jeśli wybrany silnik nie
zadziała (brak klucza, brak środków, brak sieci), program sam użyje Google
(`fallback_backend`) i pokaże powiadomienie.

### Jak włączyć DeepSeek

1. Załóż konto na <https://platform.deepseek.com>, doładuj kilka dolarów i utwórz klucz API.
2. W menu ikony wybierz **Otwórz ustawienia**. W `config.json` wklej klucz w
   `backends → deepseek → api_key`.
3. W menu ikony kliknij **Wczytaj ustawienia ponownie**, potem wybierz **DeepSeek (AI)**.

Ile to kosztuje: jedna wiadomość to ok. 250 tokenów, czyli ok. 0,0001 $. **Tysiąc
tłumaczeń to mniej niż złotówka.**

W tym samym miejscu możesz dodać inny tani model zgodny z API OpenAI (OpenRouter, Groq,
OpenAI…). Skopiuj blok `deepseek` pod nową nazwą i zmień `base_url`, `model` i `api_key`.

## Ustawienia (`config.json`)

- `hotkeys` – skróty i kierunki. Na przykład tłumaczenie w drugą stronę:
  ```json
  "hotkeys": [
    {"keys": "ctrl+alt+t", "from": "pl", "to": "en"},
    {"keys": "ctrl+alt+p", "from": "en", "to": "pl"}
  ]
  ```
- `tone` – styl tłumaczenia dla AI, np. `"formal, polite business English"`.
- `restore_clipboard` – po wklejeniu przywraca to, co wcześniej było w schowku.

Po każdej zmianie kliknij **Wczytaj ustawienia ponownie** w menu ikony.

## Problemy

- **Skrót nie działa w jakimś programie:** ten program jest uruchomiony jako administrator.
  Wtedy tłumacza też trzeba uruchomić jako administrator.
- **„Skrót jest już zajęty”:** inny program używa tego skrótu. Zmień `keys` w `config.json`.
- **Nic się nie dzieje:** sprawdź plik `tlumacz.log` w tym folderze.
- **Prywatność:** tłumaczony tekst trafia na serwery wybranego silnika (Google, DeepL
  w UE, DeepSeek w Chinach). Przy służbowych rozmowach sprawdź, co pozwala firma.

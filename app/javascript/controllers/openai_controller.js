// import { Controller } from "@hotwired/stimulus";
// import OpenAI from 'openai';

// export default class extends Controller {
//   static values = { apiKey: String };

//   async connect() {
//     try {
//       const apiKey = process.env.OPENAI_API_KEY;
//       const client = new OpenAI({ key: apiKey });
//       const restaurantCard = this.element;
//       const originalDescription = restaurantCard.querySelector(".original-description");
//       const restructuredDescription = restaurantCard.querySelector(".restructured-description");

//       const photoDescription = originalDescription.textContent.trim();

//       const response = await client.completions.create({
//         engine: 'davinci',
//         prompt: `Restructure the following photo description:\n\n${photoDescription}`,
//         max_tokens: 100,
//         temperature: 0.7,
//         top_p: 1.0,
//         n: 1
//       });
//       const restructuredText = response.choices[0].text.trim();
//       restructuredDescription.textContent = restructuredText;
//     } catch (error) {
//       console.error(error);
//     }
//   }
// }

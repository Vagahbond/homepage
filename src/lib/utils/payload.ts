import { type BasePayload, getPayload } from 'payload';
import payloadConfig from "backend/src/payload.config.ts"
import { config as envConfig } from "dotenv";


envConfig();

class PayloadHandle {
  #payloadInstance: BasePayload | undefined;

  async #init() {

    const config = await payloadConfig;
    this.#payloadInstance = await getPayload({ config })
    console.log("Payload loaded!")
  }

  async getInstance(): Promise<BasePayload> {
    if (!this.#payloadInstance) {
      await this.#init();
    }

    if (!this.#payloadInstance) {
      throw new Error("Something went wrong while loading payload CMS!")
    }

    return this.#payloadInstance
  }

}

export const SupportedLanguages = ["fr", "en"]

export default new PayloadHandle();

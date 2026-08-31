import { ErrorView } from "@/components/error/error-view";
import { useHighlights } from "./api";
import { FeatureCards } from "./components/feature-cards";
import { Hero } from "./components/hero";
import { useGreeting } from "./hooks/use-greeting";

/**
 * Container for the home feature (ARCH-3): wires data fetching (TanStack Query)
 * and derived logic (hook) into the presentational components.
 */
export function HomePage() {
  const greeting = useGreeting();
  const { data, isPending, isError, error, refetch } = useHighlights();

  if (isPending) {
    return (
      <p aria-busy="true" className="text-muted-foreground">
        Loading highlights…
      </p>
    );
  }

  if (isError) {
    return (
      <ErrorView
        title="Could not load template highlights"
        message={error.message}
        onRetry={() => void refetch()}
      />
    );
  }

  return (
    <div className="flex flex-col gap-8">
      <Hero
        title={`${greeting}! This is the standard frontend template`}
        subtitle="A screaming, feature-based React 19 architecture with an accessible shell, server state, and typed error handling."
      />
      <FeatureCards features={data} />
    </div>
  );
}
